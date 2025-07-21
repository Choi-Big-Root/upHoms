const express = require('express');
const multer = require('multer');
const path = require('path');
const fs = require('fs');

const app = express();
const port = 3000;

// Create uploads directory if it doesn't exist
const uploadsDir = path.join(__dirname, 'uploads');
if (!fs.existsSync(uploadsDir)) {
    fs.mkdirSync(uploadsDir);
}

// Set up storage for uploaded files
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, uploadsDir);
    },
    filename: (req, file, cb) => {
        cb(null, Date.now() + path.extname(file.originalname)); // Append timestamp to original file name
    }
});

const upload = multer({ storage: storage });

// Serve static files from the 'uploads' directory
app.use('/uploads', express.static(uploadsDir));

// Middleware to parse JSON bodies
app.use(express.json()); // Add this line

// Image upload endpoint
app.post('/upload', upload.single('image'), (req, res) => {
    if (!req.file) {
        return res.status(400).send('No file uploaded.');
    }
    res.send({
        message: 'File uploaded successfully!',
        filename: req.file.filename,
        filepath: `/uploads/${req.file.filename}`
    });
});

// Basic route for testing server
app.get('/', (req, res) => {
    res.send('Node.js server is running!');
});

// User Login : 로그인
app.post('/login', (req, res) => {
    const userRequest = req.body; // 클라이언트로부터 받은 이메일과 비밀번호

    // 이메일과 비밀번호가 요청 본문에 있는지 확인
    if (!userRequest.email || !userRequest.password) {
        return res.status(400).send('이메일 또는 패스워드를 입력 해 주세요.');
    }

    fs.readFile(path.join(__dirname, 'users.json'), 'utf8', (err, data) => {
        if (err) {
            console.error('Error reading users.json:', err);
            return res.status(500).send('SERVER ERROR');
        }

        let users = [];
        try {
            users = JSON.parse(data);
        } catch (parseErr) {
            console.error('Error parsing users.json:', parseErr);
            return res.status(500).send('User data is corrupted.');
        }

        //이메일과 비밀번호가 일치하는 사용자 찾기
        const foundUser = users.find(user =>
            user.email === userRequest.email && user.password === userRequest.password
        );

        if (foundUser) {
            const userResponse = { ...foundUser }; // 불변성을 위해 복사
            delete userResponse.password; // 비밀번호 필드 제거

            console.log(`Login successful for user: ${foundUser.email}`);
            return res.status(200).json(userResponse); // 200 OK와 함께 사용자 정보 JSON 반환
        } else {
            // 사용자를 찾지 못했거나 비밀번호가 일치하지 않을 경우
            console.log(`Login failed for email: ${userRequest.email}`);
            return res.status(401).send('이메일 또는 비밀번호가 일치하지 않습니다.'); // 401 Unauthorized 반환
        }
    });
});

// User Create: 유저 생성
app.post('/user_create', (req, res) => {
    const newUserRequest = req.body;

    fs.readFile(path.join(__dirname, 'users.json'), 'utf8', (err, data) => {
        if (err) {
            console.error('Error reading users.json:', err);
            return res.status(500).send('SERVER ERROR');
        }

        let users = [];
        try {
            users = JSON.parse(data);
        } catch (parseErr) {
            console.error('Error parsing users.json:', parseErr);
            return res.status(500).send('User data is corrupted.');
        }
        
        //자동 증가 uid 생성 (마지막 uid + 1)
        const lastUid = users.length > 0 ? users[users.length - 1].uid || 0 : 0;
        const newUid = parseInt(lastUid) + 1;

        const existingUser = users.find(user => user.email === newUserRequest.email);

        if (existingUser) {
            // 이미 동일한 이메일이 존재하는 경우
            return res.status(409).send('이미 가입된 이메일이 존재 합니다.');
        }

        const newUser = {
            ...newUserRequest,           // 나머지 요청 필드 포함
            uid: newUid,                  // 자동 생성된 uid
            createdTime: new Date().toISOString(), // 타임스탬프도 같이
        };

        users.push(newUser);

        fs.writeFile(path.join(__dirname, 'users.json'), JSON.stringify(users, null, 2), (err) => {
            if (err) {
                console.error('Error writing users.json:', err);
                return res.status(500).send('SERVER ERROR');
            }    
            res.status(201).json(newUser); // uid 포함된 유저 정보 반환
        });
    });
});

// /add_property: 부동산 정보 생성 및 저장
const PROPERTIES_FILE = path.join(__dirname, 'properties.json');
const USERS_FILE = path.join(__dirname, 'users.json');

app.post('/add_property', (req, res) => {
    const newPropertyRequest = req.body;

    // 필수 필드 검증 (propertyName, propertyAddress, price)
    if (!newPropertyRequest.propertyName || !newPropertyRequest.propertyAddress || !newPropertyRequest.price) {
        return res.status(400).send('Missing required property fields: propertyName, propertyAddress, price.');
    }

    // 유저 정보 검증 (user.uid 또는 user.email이 존재해야 함)
    if (!newPropertyRequest.user || (!newPropertyRequest.user.uid && !newPropertyRequest.user.email)) {
        return res.status(400).send('User information (uid or email) is required in the request body.');
    }

    // --- 프로퍼티 저장 로직 시작 ---
    fs.readFile(PROPERTIES_FILE, 'utf8', (err, data) => {
        let properties = [];
        if (err) {
            if (err.code === 'ENOENT') {
                console.log('properties.json not found, creating a new one.');
            } else {
                console.error('Error reading properties.json:', err);
                return res.status(500).send('SERVER ERROR while reading property data.');
            }
        } else {
            try {
                properties = JSON.parse(data);
            } catch (parseErr) {
                console.error('Error parsing properties.json:', parseErr);
                return res.status(500).send('Property data is corrupted.');
            }
        }

        const lastPropertyId = properties.length > 0
            ? Math.max(...properties.map(p => {
                return parseInt(p.propertyId) || 0;
            }))
            : 0;
        const newPropertyId = lastPropertyId + 1;

        // 새로운 Property 객체 생성
        const newProperty = {
            ...newPropertyRequest,
            propertyId: newPropertyId,
            createdTime: new Date().toISOString(),
            lastUpdated: new Date().toISOString()
        };

        // --- PropertyModel 내부 user 객체 업데이트 시작 ---
        // 클라이언트에서 보낸 user 객체에 numberPropertyList가 없을 경우 초기화
        if (!newProperty.user.numberPropertyList) {
            newProperty.user.numberPropertyList = [];
        }
        // propertyId를 PropertyModel 내 user의 numberPropertyList에 추가
        newProperty.user.numberPropertyList.push(newPropertyId);
        // --- PropertyModel 내부 user 객체 업데이트 끝 ---

        properties.push(newProperty);

        fs.writeFile(PROPERTIES_FILE, JSON.stringify(properties, null, 2), (err) => {
            if (err) {
                console.error('Error writing properties.json:', err);
                return res.status(500).send('SERVER ERROR while writing property data.');
            }

            // --- users.json 업데이트 로직 시작 ---
            fs.readFile(USERS_FILE, 'utf8', (userErr, userData) => {
                if (userErr) {
                    console.error('Error reading users.json:', userErr);
                    console.warn('Property saved, but failed to update user list.');
                    return res.status(201).json(newProperty);
                }

                let users = [];
                try {
                    users = JSON.parse(userData);
                } catch (parseUserErr) {
                    console.error('Error parsing users.json:', parseUserErr);
                    console.warn('Property saved, but user data is corrupted.');
                    return res.status(201).json(newProperty);
                }

                const targetUserIdentifier = newPropertyRequest.user.uid || newPropertyRequest.user.email;
                const userKey = newPropertyRequest.user.uid ? 'uid' : 'email';

                const userIndex = users.findIndex(u => {
                    return u[userKey] == (userKey === 'uid' ? parseInt(targetUserIdentifier) : targetUserIdentifier);
                });

                if (userIndex !== -1) {
                    if (!users[userIndex].numberPropertyList) {
                        users[userIndex].numberPropertyList = [];
                    }
                    users[userIndex].numberPropertyList.push(newPropertyId);

                    fs.writeFile(USERS_FILE, JSON.stringify(users, null, 2), (writeUserErr) => {
                        if (writeUserErr) {
                            console.error('Error writing users.json:', writeUserErr);
                            console.warn('Property saved, but failed to update user list.');
                            return res.status(201).json(newProperty);
                        }
                        console.log(`Property ID ${newProperty.propertyId} added to user ${users[userIndex][userKey]}'s numberPropertyList in users.json.`);
                        res.status(201).json(newProperty);
                    });
                } else {
                    console.warn(`Could not find user with ${userKey}: ${targetUserIdentifier} to update numberPropertyList in users.json.`);
                    res.status(201).json(newProperty);
                }
            });
            // --- users.json 업데이트 로직 끝 ---
        });
    });
});


app.listen(port, () => {
    console.log(`Server listening at http://localhost:${port}`);
});
