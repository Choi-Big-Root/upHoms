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


app.listen(port, () => {
    console.log(`Server listening at http://localhost:${port}`);
});
