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


// /add_property: 부동산 정보 생성 및 저장
const PROPERTIES_FILE = path.join(__dirname, 'properties.json');
const USERS_FILE = path.join(__dirname, 'users.json'); 
const REVIEWS_FILE = path.join(__dirname, 'reviews.json'); 


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

// --- GET /properties 엔드포인트 수정 ---
app.get('/properties', (req, res) => {
    Promise.all([
        fs.promises.readFile(PROPERTIES_FILE, 'utf8'),
        fs.promises.readFile(REVIEWS_FILE, 'utf8').catch(err => {
            if (err.code === 'ENOENT') {
                console.log('reviews.json not found, treating as empty for ratingSummary calculation.');
                return '[]'; 
            }
            throw err; 
        })
    ])
    .then(([propertiesData, reviewsData]) => {
        let properties = [];
        let reviews = [];

        try {
            properties = JSON.parse(propertiesData);
        } catch (parseErr) {
            console.error('Error parsing properties.json:', parseErr);
            return res.status(500).send('Property data is corrupted.');
        }

        try {
            reviews = JSON.parse(reviewsData);
        } catch (parseErr) {
            console.error('Error parsing reviews.json:', parseErr);
            reviews = [];
        }

        const propertiesWithRatings = properties.map(property => {
            const relatedReviews = reviews.filter(review => review.propertyId == property.propertyId);

            let calculatedRatingSummary = 0; // 기본값 0
            if (relatedReviews.length > 0) {
                const totalRating = relatedReviews.reduce((sum, review) => sum + (review.rating || 0), 0);
                calculatedRatingSummary = parseFloat((totalRating / relatedReviews.length).toFixed(1)); 
            }

            // ✨ 기존 property 객체의 ratingSummary 필드를 업데이트
            return {
                ...property,
                // property.ratingSummary가 이미 존재한다면 이 값으로 덮어씌워집니다.
                // 존재하지 않으면 새로 추가됩니다.
                ratingSummary: calculatedRatingSummary 
            };
        });

        propertiesWithRatings.sort((a, b) => {
            const dateA = a.lastUpdated ? new Date(a.lastUpdated) : new Date(0);
            const dateB = b.lastUpdated ? new Date(b.lastUpdated) : new Date(0);
            return dateB.getTime() - dateA.getTime();
        });

        console.log(`Successfully retrieved ${propertiesWithRatings.length} properties, with updated ratingSummary and sorted.`);
        res.status(200).json(propertiesWithRatings);
    })
    .catch(err => {
        console.error('SERVER ERROR during /properties data retrieval:', err);
        return res.status(500).send('SERVER ERROR while processing property data.');
    });
});

// /property_search: 검색어로 부동산 정보 가져오기
app.post('/property_search', (req, res) => {
    let searchText;

    if (typeof req.body === 'string') {
        searchText = req.body.toLowerCase().trim();
    }
    else if (typeof req.body === 'object' && req.body !== null && req.body.searchText) {
        searchText = String(req.body.searchText).toLowerCase().trim();
    } else {
        console.error('Unexpected req.body type for /property_search:', req.body);
        return res.status(400).send('Invalid search text format. Please send a plain string or a JSON object with a "searchText" key.');
    }

    if (!searchText) {
        return res.status(400).send('Search text is required in the request body.');
    }

    Promise.all([
        fs.promises.readFile(PROPERTIES_FILE, 'utf8'),
        fs.promises.readFile(REVIEWS_FILE, 'utf8').catch(err => {
            if (err.code === 'ENOENT') {
                return '[]';
            }
            throw err;
        })
    ])
    .then(([propertiesData, reviewsData]) => {
        let properties = [];
        let reviews = [];

        try {
            properties = JSON.parse(propertiesData);
        } catch (parseErr) {
            console.error('Error parsing properties.json for search:', parseErr);
            return res.status(500).send('Property data is corrupted.');
        }

        try {
            reviews = JSON.parse(reviewsData);
        } catch (parseErr) {
            console.error('Error parsing reviews.json for search:', parseErr);
            reviews = [];
        }

        const searchResults = properties.filter(property => {
            const propertyAddress = property.propertyAddress?.toString().toLowerCase() || '';
            const propertyCity = property.propertyCity?.toString().toLowerCase() || '';
            const propertyState = property.propertyState?.toString().toLowerCase() || '';
            const propertyNeighborhood = property.propertyNeighborhood?.toString().toLowerCase() || '';

            return propertyAddress.includes(searchText) ||
                   propertyCity.includes(searchText) ||
                   propertyState.includes(searchText) ||
                   propertyNeighborhood.includes(searchText);
        });

        // 검색된 프로퍼티에도 ratingSummary 업데이트
        const searchResultsWithRatings = searchResults.map(property => {
            const relatedReviews = reviews.filter(review => review.propertyId == property.propertyId);
            let calculatedRatingSummary = 0;
            if (relatedReviews.length > 0) {
                const totalRating = relatedReviews.reduce((sum, review) => sum + (review.rating || 0), 0);
                calculatedRatingSummary = parseFloat((totalRating / relatedReviews.length).toFixed(1));
            }
            return {
                ...property,
                ratingSummary: calculatedRatingSummary // ✨ ratingSummary 필드 업데이트
            };
        });

        console.log(`Found ${searchResultsWithRatings.length} properties matching "${searchText}", with updated ratingSummary.`);
        res.status(200).json(searchResultsWithRatings);
    })
    .catch(err => {
        console.error('SERVER ERROR during /property_search data retrieval:', err);
        return res.status(500).send('SERVER ERROR while processing search data.');
    });
});

//프로퍼티 단일
app.post('/get_property', (req, res) => {
    let requestedPropertyId;

    // 클라이언트에서 @Body() Map<String,dynamic> propertyId로 보내므로, req.body는 객체일 것
    // 요청 본문에서 'propertyId' 키를 찾아 값을 추출합니다.
    if (typeof req.body === 'object' && req.body !== null && (req.body.propertyId !== undefined || req.body.propertyId !== null)) {
        requestedPropertyId = parseInt(req.body.propertyId); // 정수로 변환
    } else if (typeof req.body === 'string') {
        // 혹시 모르니 문자열로 단일 ID가 왔을 경우도 대비
        try {
            const parsedBody = JSON.parse(req.body); // JSON 문자열로 왔을 경우 파싱
            if (parsedBody && (parsedBody.propertyId !== undefined || parsedBody.propertyId !== null)) {
                requestedPropertyId = parseInt(parsedBody.propertyId);
            }
        } catch (e) {
            // JSON 파싱 실패 시, 문자열 자체를 ID로 시도 (fallback)
            requestedPropertyId = parseInt(req.body);
        }
    }

    if (isNaN(requestedPropertyId)) { // propertyId가 유효한 숫자가 아닐 경우
        console.error('Invalid or missing propertyId in request body for /get_property:', req.body);
        return res.status(400).send('Valid propertyId is required in the request body.');
    }

    // properties.json과 reviews.json 파일을 동시에 읽음
    Promise.all([
        fs.promises.readFile(PROPERTIES_FILE, 'utf8'),
        fs.promises.readFile(REVIEWS_FILE, 'utf8').catch(err => {
            if (err.code === 'ENOENT') {
                console.log('reviews.json not found for /get_property, treating as empty.');
                return '[]'; 
            }
            throw err; 
        })
    ])
    .then(([propertiesData, reviewsData]) => {
        let properties = [];
        let reviews = [];

        try {
            properties = JSON.parse(propertiesData);
        } catch (parseErr) {
            console.error('Error parsing properties.json for /get_property:', parseErr);
            return res.status(500).send('Property data is corrupted.');
        }

        try {
            reviews = JSON.parse(reviewsData);
        } catch (parseErr) {
            console.error('Error parsing reviews.json for /get_property:', parseErr);
            reviews = []; // 리뷰 데이터 파싱 오류 시 빈 배열로 처리
        }

        // 요청된 propertyId에 해당하는 단일 프로퍼티를 찾음
        const foundProperty = properties.find(p => p.propertyId == requestedPropertyId);

        if (!foundProperty) {
            console.log(`Property with ID ${requestedPropertyId} not found.`);
            return res.status(404).send(`Property with ID ${requestedPropertyId} not found.`);
        }

        // 해당 프로퍼티의 리뷰를 필터링하고 ratingSummary 계산
        const relatedReviews = reviews.filter(review => review.propertyId == foundProperty.propertyId);

        let calculatedRatingSummary = 0;
        if (relatedReviews.length > 0) {
            const totalRating = relatedReviews.reduce((sum, review) => sum + (review.rating || 0), 0);
            calculatedRatingSummary = parseFloat((totalRating / relatedReviews.length).toFixed(1));
        }

        // 찾은 프로퍼티 객체에 ratingSummary를 업데이트하여 반환
        const propertyWithRating = {
            ...foundProperty,
            ratingSummary: calculatedRatingSummary
        };

        console.log(`Successfully retrieved property ID ${requestedPropertyId} with ratingSummary: ${calculatedRatingSummary}.`);
        res.status(200).json(propertyWithRating); // 단일 PropertyDto 객체 반환
    })
    .catch(err => {
        console.error('SERVER ERROR during /get_property data retrieval:', err);
        return res.status(500).send('SERVER ERROR while processing property data for single retrieval.');
    });
});


//리뷰
app.post('/get_reviews', (req, res) => {
    let requestedPropertyId;

    // 클라이언트에서 @Body() Map<String,dynamic> propertyId로 보내므로, req.body는 객체일 것
    // 요청 본문에서 'propertyId' 키를 찾아 값을 추출합니다.
    if (typeof req.body === 'object' && req.body !== null && (req.body.propertyId !== undefined || req.body.propertyId !== null)) {
        requestedPropertyId = parseInt(req.body.propertyId); // 정수로 변환
    } else if (typeof req.body === 'string') {
        // 혹시 모르니 문자열로 단일 ID가 왔을 경우도 대비
        try {
            const parsedBody = JSON.parse(req.body); // JSON 문자열로 왔을 경우 파싱
            if (parsedBody && (parsedBody.propertyId !== undefined || parsedBody.propertyId !== null)) {
                requestedPropertyId = parseInt(parsedBody.propertyId);
            }
        } catch (e) {
            // JSON 파싱 실패 시, 문자열 자체를 ID로 시도 (fallback)
            requestedPropertyId = parseInt(req.body);
        }
    }

    if (isNaN(requestedPropertyId)) { // propertyId가 유효한 숫자가 아닐 경우
        console.error('Invalid or missing propertyId in request body for /get_reviews:', req.body);
        return res.status(400).send('Valid propertyId is required in the request body.');
    }

    fs.promises.readFile(REVIEWS_FILE, 'utf8')
        .then(reviewsData => {
            let reviews = [];
            try {
                reviews = JSON.parse(reviewsData);
            } catch (parseErr) {
                console.error('Error parsing reviews.json for /get_reviews:', parseErr);
                // 리뷰 데이터 파싱 오류 시 빈 배열 반환 (에러 응답 대신)
                return res.status(200).json([]);
            }

            // 요청된 propertyId에 해당하는 모든 리뷰를 필터링
            const filteredReviews = reviews.filter(review => review.propertyId == requestedPropertyId);

            console.log(`Successfully retrieved ${filteredReviews.length} reviews for property ID ${requestedPropertyId}.`);
            res.status(200).json(filteredReviews); // 필터링된 리뷰 리스트 반환
        })
        .catch(err => {
            // reviews.json 파일 자체가 없거나 읽기 오류 발생 시
            if (err.code === 'ENOENT') {
                console.log('reviews.json not found for /get_reviews, returning empty list.');
                return res.status(200).json([]); // 파일이 없으면 빈 배열 반환
            }
            console.error('SERVER ERROR during /get_reviews data retrieval:', err);
            return res.status(500).send('SERVER ERROR while processing review data.');
        });
});



app.listen(port, () => {
    console.log(`Server listening at http://localhost:${port}`);
});