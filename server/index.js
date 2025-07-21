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

// --- ✨ 중요: body-parser 미들웨어 순서 변경 및 추가 ---
// 1. JSON 요청 본문을 파싱하기 위한 미들웨어 (가장 먼저 위치하여 일반적인 JSON 요청을 처리)
app.use(express.json());
// 2. 평범한 텍스트 요청 본문을 파싱하기 위한 미들웨어 추가
//    이 미들웨어는 Content-Type이 'text/plain'일 때 req.body를 문자열로 파싱합니다.
//    (body-parser의존성을 명시적으로 설치하지 않았다면, 'express' 내부에 포함되어 있습니다.)
app.use(express.text());
// --- ✨ 여기까지가 body-parser 미들웨어 설정입니다. ---


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
const USERS_FILE = path.join(__dirname, 'users.json'); // users.json 파일 경로 추가

app.post('/add_property', (req, res) => {
    const newPropertyRequest = req.body;

    // 필수 필드 검증 (propertyName, propertyAddress, price)
    if (!newPropertyRequest.propertyName || !newPropertyRequest.propertyAddress || !newPropertyRequest.price) {
        return res.status(400).send('Missing required property fields: propertyName, propertyAddress, price.');
    }

    // 유저 정보 검증 (user.uid 또는 user.email이 존재해야 함)
    // 클라이언트에서 보낸 user 객체가 있는지 확인하고, uid나 email 중 하나는 필수적으로 있어야 해당 유저를 찾을 수 있습니다.
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
                // propertyId가 문자열일 수 있으므로 parseInt로 변환
                return parseInt(p.propertyId) || 0;
            }))
            : 0;
        const newPropertyId = lastPropertyId + 1;

        const newProperty = {
            ...newPropertyRequest,
            propertyId: newPropertyId,
            createdTime: new Date().toISOString(),
            lastUpdated: new Date().toISOString()
        };

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
                    // users.json 읽기 실패 시, property는 저장했으므로 201 응답은 보내되 로그 남김
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

                // 해당 유저 찾기 (uid 또는 email로 찾기)
                const targetUserIdentifier = newPropertyRequest.user.uid || newPropertyRequest.user.email;
                const userKey = newPropertyRequest.user.uid ? 'uid' : 'email';

                const userIndex = users.findIndex(u => {
                    // 사용자 UID가 숫자일 경우 대비 parseInt
                    return u[userKey] == (userKey === 'uid' ? parseInt(targetUserIdentifier) : targetUserIdentifier);
                });

                if (userIndex !== -1) {
                    // 유저를 찾았다면 numberPropertyList에 propertyId 추가
                    if (!users[userIndex].numberPropertyList) {
                        users[userIndex].numberPropertyList = [];
                    }
                    users[userIndex].numberPropertyList.push(newPropertyId);

                    // 업데이트된 users 데이터 저장
                    fs.writeFile(USERS_FILE, JSON.stringify(users, null, 2), (writeUserErr) => {
                        if (writeUserErr) {
                            console.error('Error writing users.json:', writeUserErr);
                            console.warn('Property saved, but failed to update user list.');
                            return res.status(201).json(newProperty);
                        }
                        console.log(`Property ID ${newProperty.propertyId} added to user ${users[userIndex][userKey]}'s numberPropertyList.`);
                        res.status(201).json(newProperty); // 모든 작업 성공 후 응답
                    });
                } else {
                    // 해당 유저를 찾을 수 없는 경우
                    console.warn(`Could not find user with ${userKey}: ${targetUserIdentifier} to update numberPropertyList.`);
                    res.status(201).json(newProperty); // 프로퍼티는 저장되었으므로 201 응답
                }
            });
            // --- users.json 업데이트 로직 끝 ---
        });
    });
});

app.get('/properties', (req, res) => {
    fs.readFile(PROPERTIES_FILE, 'utf8', (err, data) => {
        if (err) {
            // 파일이 없으면 빈 배열 반환 (오류가 아님)
            if (err.code === 'ENOENT') {
                console.log('properties.json not found, returning empty array.');
                return res.status(200).json([]); // 빈 배열 반환
            } else {
                console.error('Error reading properties.json:', err);
                return res.status(500).send('SERVER ERROR while reading property data.');
            }
        }

        let properties = [];
        try {
            properties = JSON.parse(data);
        } catch (parseErr) {
            console.error('Error parsing properties.json:', parseErr);
            return res.status(500).send('Property data is corrupted.');
        }

        properties.sort((a, b) => {
            // lastUpdated 필드가 없는 경우를 대비하여 기본값 설정 (예: 과거 날짜)
            const dateA = a.lastUpdated ? new Date(a.lastUpdated) : new Date(0); // Epoch 시작
            const dateB = b.lastUpdated ? new Date(b.lastUpdated) : new Date(0); // Epoch 시작

            // 내림차순 정렬 (최신 날짜가 먼저 오도록)
            return dateB.getTime() - dateA.getTime();
        });

        console.log(`Successfully retrieved ${properties.length} properties, sorted by lastUpdated.`);
        res.status(200).json(properties); // 정렬된 프로퍼티 데이터 반환
    });
});

// /property_search: 검색어로 부동산 정보 가져오기
app.post('/property_search', (req, res) => {
    let searchText;

    // ✨ req.body의 타입에 따라 searchText 추출 방식 결정
    // 클라이언트가 @Body() String searchText로 보내면 Content-Type이 'text/plain'일 수 있으며,
    // 이 경우 bodyParser.text()가 req.body를 직접 문자열로 파싱합니다.
    if (typeof req.body === 'string') {
        searchText = req.body.toLowerCase().trim();
    }
    // 만약 클라이언트가 실수로 Content-Type을 'application/json'으로 보내면서
    // 유효하지 않은 JSON 문자열(예: 'test')을 보낸다면, bodyParser.json()에서 에러가 날 수 있습니다.
    // 하지만 유효한 JSON 객체로 보냈다면 (예: {"searchText": "test"}), 이 분기로 올 수 있습니다.
    else if (typeof req.body === 'object' && req.body !== null && req.body.searchText) {
        searchText = req.body.searchText.toLowerCase().trim();
    } else {
        // 예상치 못한 req.body 형식
        console.error('Unexpected req.body type for /property_search:', req.body);
        return res.status(400).send('Invalid search text format. Please send a plain string or a JSON object with a "searchText" key.');
    }

    if (!searchText) {
        return res.status(400).send('Search text is required in the request body.');
    }

    fs.readFile(PROPERTIES_FILE, 'utf8', (err, data) => {
        if (err) {
            if (err.code === 'ENOENT') {
                console.log('properties.json not found, returning empty array for search.');
                return res.status(200).json([]);
            } else {
                console.error('Error reading properties.json for search:', err);
                return res.status(500).send('SERVER ERROR while reading property data for search.');
            }
        }

        let properties = [];
        try {
            properties = JSON.parse(data);
        } catch (parseErr) {
            console.error('Error parsing properties.json for search:', parseErr);
            return res.status(500).send('Property data is corrupted.');
        }

        const searchResults = properties.filter(property => {
            // 필드가 없을 경우를 대비하여 안전하게 접근하고 소문자로 변환
            const propertyAddress = property.propertyAddress?.toString().toLowerCase() || '';
            const propertyCity = property.propertyCity?.toString().toLowerCase() || '';
            const propertyState = property.propertyState?.toString().toLowerCase() || '';
            const propertyNeighborhood = property.propertyNeighborhood?.toString().toLowerCase() || '';

            // 하나라도 검색어를 포함하면 true 반환
            return propertyAddress.includes(searchText) ||
                   propertyCity.includes(searchText) ||
                   propertyState.includes(searchText) ||
                   propertyNeighborhood.includes(searchText);
        });

        console.log(`Found ${searchResults.length} properties matching "${searchText}".`);
        res.status(200).json(searchResults); // 검색 결과 반환
    });
});

app.listen(port, () => {
    console.log(`Server listening at http://localhost:${port}`);
});