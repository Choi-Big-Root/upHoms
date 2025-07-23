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
// 💡 여기를 수정합니다:
// JSON 요청 본문의 최대 크기를 설정합니다.
// '50mb'는 50메가바이트를 의미합니다. 필요에 따라 더 크게 설정할 수 있습니다.
app.use(express.json({ limit: '100mb', strict: false })); 

// URL-encoded 데이터(폼 데이터)의 최대 크기도 설정합니다.
// 이미지 업로드 시 base64 인코딩 등으로 데이터가 커질 수 있으므로 함께 설정하는 것이 좋습니다.
app.use(express.urlencoded({ limit: '100mb', extended: true }));

// 일반 텍스트 본문도 사용하는 경우 (현재 코드에 이미 있음)
app.use(express.text({ limit: '100mb' })); 
// --- ✨ 여기까지가 body-parser 미들웨어 설정입니다. ---


// /add_property: 부동산 정보 생성 및 저장
const PROPERTIES_FILE = path.join(__dirname, 'properties.json');
const USERS_FILE = path.join(__dirname, 'users.json'); 
const REVIEWS_FILE = path.join(__dirname, 'reviews.json'); 
const TRIPS_FILE = path.join(__dirname, 'trips.json');


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
app.post('/user_update', (req, res) => {
    let updateUserRequest = req.body;

    if (typeof updateUserRequest === 'string') {
        try {
            updateUserRequest = JSON.parse(updateUserRequest);
        } catch (e) {
            console.error('Error parsing updateUserRequest as JSON string:', e);
            return res.status(400).send('Invalid JSON format for user update. (If sending as plain text, it must be valid JSON)');
        }
    }

    // 필수 필드 유효성 검사: uid는 반드시 존재해야 합니다.
    if (updateUserRequest.uid === undefined || updateUserRequest.uid === null) {
        return res.status(400).send('User UID is required for update.');
    }

    const requestedUid = parseInt(updateUserRequest.uid);
    if (isNaN(requestedUid)) {
        console.error('Invalid UID in request body for /user_update:', updateUserRequest.uid);
        return res.status(400).send('Valid User UID is required for update.');
    }

    // 모든 관련 파일들을 동시에 읽기
    Promise.all([
        fs.promises.readFile(USERS_FILE, 'utf8').catch(err => {
            if (err.code === 'ENOENT') throw new Error('USERS_FILE not found.');
            throw err;
        }),
        fs.promises.readFile(PROPERTIES_FILE, 'utf8').catch(err => {
            if (err.code === 'ENOENT') return '[]'; // properties.json 없으면 빈 배열로 시작
            throw err;
        }),
        fs.promises.readFile(REVIEWS_FILE, 'utf8').catch(err => {
            if (err.code === 'ENOENT') return '[]'; // reviews.json 없으면 빈 배열로 시작
            throw err;
        })
    ])
    .then(([usersData, propertiesData, reviewsData]) => {
        let users = [];
        let properties = [];
        let reviews = [];

        let usersChanged = false;
        let propertiesChanged = false;
        let reviewsChanged = false;

        try {
            users = JSON.parse(usersData);
        } catch (parseErr) {
            console.error('Error parsing users.json for /user_update:', parseErr);
            return res.status(500).send('User data is corrupted or malformed.');
        }

        try {
            properties = JSON.parse(propertiesData);
        } catch (parseErr) {
            console.error('Error parsing properties.json for /user_update:', parseErr);
            properties = [];
        }

        try {
            reviews = JSON.parse(reviewsData);
        } catch (parseErr) {
            console.error('Error parsing reviews.json for /user_update:', parseErr);
            reviews = [];
        }

        const userIndex = users.findIndex(u => parseInt(u.uid) === requestedUid);

        if (userIndex === -1) {
            console.log(`User with UID ${requestedUid} not found for update.`);
            return res.status(404).send(`User with UID ${requestedUid} not found.`);
        }

        const currentUser = users[userIndex];
        const oldEmail = currentUser.email; // 변경 전 이메일
        const oldDisplayName = currentUser.displayName; // 변경 전 displayName

        // 사용자 정보 업데이트
        // 전달된 필드만 업데이트, 없는 필드는 기존 값 유지
        if (updateUserRequest.displayName !== undefined && updateUserRequest.displayName !== null) {
            currentUser.displayName = updateUserRequest.displayName;
        }
        if (updateUserRequest.email !== undefined && updateUserRequest.email !== null) {
            // 이메일 변경 감지
            if (currentUser.email !== updateUserRequest.email) {
                 // 새로 변경될 이메일이 이미 존재하는지 확인
                const emailExists = users.some(u => u.email === updateUserRequest.email && parseInt(u.uid) !== requestedUid);
                if (emailExists) {
                    return res.status(409).send('Updated email already exists for another user.');
                }
            }
            currentUser.email = updateUserRequest.email;
        }
        if (updateUserRequest.bio !== undefined && updateUserRequest.bio !== null) {
            currentUser.bio = updateUserRequest.bio;
        }
        if (updateUserRequest.photoUrl !== undefined && updateUserRequest.photoUrl !== null) {
            currentUser.photoUrl = updateUserRequest.photoUrl;
        }
        currentUser.lastUpdated = new Date().toISOString(); // 마지막 업데이트 시간

        usersChanged = true; // users.json 변경 플래그 설정

        // properties.json 업데이트
        properties.forEach(property => {
            // property.user 필드가 존재하고, 해당 user의 uid가 현재 업데이트하는 사용자의 uid와 일치하며
            // email 또는 displayName이 변경된 경우 업데이트
            if (property.user && parseInt(property.user.uid) === requestedUid) {
                if (property.user.email !== currentUser.email || property.user.displayName !== currentUser.displayName) {
                    property.user.email = currentUser.email;
                    property.user.displayName = currentUser.displayName;
                    propertiesChanged = true;
                    console.log(`  - Updated user info in property ID ${property.propertyId}`);
                }
            }
        });

        // reviews.json 업데이트
        reviews.forEach(review => {
            // review.userUid 또는 review.propertyId.user (이런 구조가 있다면)를 통해 연결될 수 있음
            // 여기서는 review.userUid (uid만 있고 이메일, displayName 없는 경우)와
            // review.user (사용자 객체가 통째로 들어있는 경우) 두 가지 가능성을 고려하여 구현
            
            // 1. review.userUid만 있는 경우 (UID만으로 연결)
            if (parseInt(review.userUid) === requestedUid) {
                // reviews.json에 userEmail 또는 userDisplayName 필드를 직접 업데이트하는 시나리오
                // review 스키마에 email, displayName 필드가 있다면 여기에 추가
                if (review.userEmail !== currentUser.email) { // 예시: review에 userEmail 필드가 있다면
                    review.userEmail = currentUser.email;
                    reviewsChanged = true;
                }
                if (review.userDisplayName !== currentUser.displayName) { // 예시: review에 userDisplayName 필드가 있다면
                    review.userDisplayName = currentUser.displayName;
                    reviewsChanged = true;
                }
                // (만약 reviews에 user 객체가 통째로 들어있지 않고 uid만 있다면, 이 부분은 생략될 수 있습니다.)
                console.log(`  - Updated user info in review ID ${review.reviewId} (by userUid)`);
            }
            
            // 2. review 객체 내에 user 객체가 통째로 들어있는 경우 (더 강력한 연동)
            // 예를 들어 review: { ..., user: { uid: 1, email: "...", displayName: "..." } }
            if (review.user && parseInt(review.user.uid) === requestedUid) {
                if (review.user.email !== currentUser.email || review.user.displayName !== currentUser.displayName) {
                    review.user.email = currentUser.email;
                    review.user.displayName = currentUser.displayName;
                    reviewsChanged = true;
                    console.log(`  - Updated user info in review ID ${review.reviewId} (by user object)`);
                }
            }
        });


        // 파일 쓰기 작업들을 Promise.all로 병렬 처리
        const writePromises = [];
        if (usersChanged) {
            writePromises.push(fs.promises.writeFile(USERS_FILE, JSON.stringify(users, null, 2)));
        }
        if (propertiesChanged) {
            writePromises.push(fs.promises.writeFile(PROPERTIES_FILE, JSON.stringify(properties, null, 2)));
        }
        if (reviewsChanged) {
            writePromises.push(fs.promises.writeFile(REVIEWS_FILE, JSON.stringify(reviews, null, 2)));
        }

        return Promise.all(writePromises)
            .then(() => {
                // 응답을 위해 비밀번호 필드 제거
                const userResponse = { ...currentUser };
                delete userResponse.password;

                console.log(`Successfully updated user with UID: ${requestedUid}.`);
                res.status(200).json(userResponse); // 업데이트된 UserDto 반환
            });
    })
    .catch(err => {
        if (err.message === 'USERS_FILE not found.') {
            return res.status(404).send('User data file not found.');
        }
        console.error('SERVER ERROR during /user_update:', err);
        res.status(500).send('SERVER ERROR while processing user update.');
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
app.post('/add_review', (req, res) => {
    let newReviewRequest = req.body;

    // JSON 형식 검증 및 파싱 (plain text로 오는 경우 대비)
    if (typeof newReviewRequest === 'string') {
        try {
            newReviewRequest = JSON.parse(newReviewRequest);
        } catch (e) {
            console.error('Error parsing newReviewRequest as JSON string:', e);
            return res.status(400).send('Invalid JSON format for review addition. (If sending as plain text, it must be valid JSON)');
        }
    }

    // 필수 필드 유효성 검사 (ReviewDto 구조에 따라 추가/수정 필요)
    // 예시: propertyId, userUid, rating, ratingDescription이 필수라고 가정합니다.
    if (!newReviewRequest || 
        !newReviewRequest.propertyId || 
        newReviewRequest.rating === undefined || newReviewRequest.rating === null ||
        !newReviewRequest.ratingDescription) {
        return res.status(400).send('Missing required review fields: propertyId, userUid, rating, ratingDescription.');
    }

    // Promise.all을 사용하여 reviews.json과 trips.json을 동시에 읽습니다.
    Promise.all([
        fs.promises.readFile(REVIEWS_FILE, 'utf8').catch(err => {
            if (err.code === 'ENOENT') return '[]'; // 파일 없으면 빈 배열로 시작
            throw err;
        }),
        fs.promises.readFile(TRIPS_FILE, 'utf8').catch(err => {
            if (err.code === 'ENOENT') return '[]'; // 파일 없으면 빈 배열로 시작
            throw err;
        })
    ])
    .then(([reviewsData, tripsData]) => {
        let reviews = [];
        let trips = [];
        let tripsChanged = false; // trips.json 변경 여부 플래그

        try {
            reviews = JSON.parse(reviewsData);
        } catch (parseErr) {
            console.error('Error parsing reviews.json for /add_review:', parseErr);
            reviews = []; 
            console.warn('Reviews data is corrupted, starting with an empty array for /add_review.');
        }

        try {
            trips = JSON.parse(tripsData);
        } catch (parseErr) {
            console.error('Error parsing trips.json for /add_review (for status update):', parseErr);
            trips = []; 
            console.warn('Trips data is corrupted for status update, proceeding without updating trips.json.');
        }

        // reviewId 시퀀스 생성
        const lastReviewId = reviews.length > 0 
            ? Math.max(...reviews.map(r => parseInt(r.reviewId) || 0)) 
            : 0;
        const newReviewId = lastReviewId + 1;

        // 새로운 Review 객체 생성
        const newReview = {
            ...newReviewRequest,
            reviewId: newReviewId, // 서버에서 생성한 ID 할당
            ratingCreated: new Date().toISOString(), // 현재 서버 날짜 및 시간 할당 (ISO 8601 형식)
        };

        reviews.push(newReview); // 새 리뷰를 배열에 추가

        // ✨ tripId가 존재하고 유효하면 해당 트립의 상태를 업데이트
        if (newReviewRequest.tripId !== undefined && newReviewRequest.tripId !== null) {
            const requestedTripId = parseInt(newReviewRequest.tripId);
            if (!isNaN(requestedTripId)) {
                const tripIndex = trips.findIndex(t => parseInt(t.tripId) === requestedTripId);
                if (tripIndex !== -1) {
                    // 해당 트립의 upcoming을 false, complete를 true로 변경

                        trips[tripIndex].upcoming = false;
                        trips[tripIndex].complete = true;
                        trips[tripIndex].rated = true;
                        tripsChanged = true; // 변경 사항 발생
                        console.log(`  - Trip ID ${requestedTripId} status updated to upcoming=false, complete=true due to review submission.`);
                    
                } else {
                    console.warn(`  - Trip ID ${requestedTripId} not found in trips.json. Cannot update its status.`);
                }
            } else {
                console.warn(`  - Invalid tripId "${newReviewRequest.tripId}" provided in review. Skipping trip status update.`);
            }
        } else {
            console.log('  - No tripId provided in review. Skipping trip status update.');
        }

        // 파일 쓰기 작업들을 Promise.all로 병렬 처리
        const writePromises = [
            fs.promises.writeFile(REVIEWS_FILE, JSON.stringify(reviews, null, 2))
        ];

        if (tripsChanged) {
            writePromises.push(fs.promises.writeFile(TRIPS_FILE, JSON.stringify(trips, null, 2)));
        }

        return Promise.all(writePromises)
            .then(() => {
                console.log(`Successfully added review with ID: ${newReviewId} for property ID: ${newReview.propertyId}`);
                res.status(201).json(newReview); // 생성된 review 객체와 201 Created 상태 반환
            });
    })
    .catch(err => {
        // 파일 읽기 또는 쓰기 중 발생한 일반적인 오류 처리
        console.error('SERVER ERROR during /add_review:', err);
        res.status(500).send('SERVER ERROR while adding review data or updating trip status.');
    });
});


//예약 Trip
// --- ✨ 새로운 POST /add_trip 엔드포인트 추가 ✨ ---
app.post('/add_trip', (req, res) => {
    let newTripRequest = req.body;

    // JSON 형식 검증 및 파싱 (plain text로 오는 경우 대비)
    if (typeof newTripRequest === 'string') {
        try {
            newTripRequest = JSON.parse(newTripRequest);
        } catch (e) {
            console.error('Error parsing newTripRequest as JSON string:', e);
            return res.status(400).send('Invalid JSON format for trip addition. (If sending as plain text, it must be valid JSON)');
        }
    }

    // 필수 필드 유효성 검사 (TripDto 구조에 따라 추가/수정 필요)
    // 예시: userId, propertyId, startDate, endDate가 필수라고 가정합니다.
    if (!newTripRequest || 
        !newTripRequest.userId || 
        !newTripRequest.propertyId) {
        return res.status(400).send('Missing required trip fields: userId, propertyId, startDate, endDate.');
    }

    // trips.json 파일 읽기
    fs.promises.readFile(TRIPS_FILE, 'utf8')
        .then(data => {
            let trips = [];
            try {
                trips = JSON.parse(data);
            } catch (parseErr) {
                console.error('Error parsing trips.json:', parseErr);
                // 파일 내용이 손상되었거나 유효한 JSON이 아닌 경우
                // 기존 데이터를 무시하고 새 배열로 시작합니다.
                trips = []; 
                console.warn('Trips data is corrupted, starting with an empty array for /add_trip.');
            }

            // tripId 시퀀스 생성
            // 기존 trips 중 가장 큰 tripId를 찾아 1을 더하여 새 ID를 생성합니다.
            const lastTripId = trips.length > 0 
                ? Math.max(...trips.map(t => parseInt(t.tripId) || 0)) 
                : 0;
            const newTripId = lastTripId + 1;

            // 새로운 Trip 객체 생성
            const newTrip = {
                ...newTripRequest,
                tripId: newTripId, // 서버에서 생성한 ID 할당
                createdTime: new Date().toISOString(), // 생성 시간 추가 (ISO 8601 형식)
            };

            trips.push(newTrip); // 새 트립을 배열에 추가

            // trips.json 파일에 저장
            return fs.promises.writeFile(TRIPS_FILE, JSON.stringify(trips, null, 2))
                .then(() => {
                    console.log(`Successfully added trip with ID: ${newTripId}`);
                    res.status(201).json(newTrip); // 생성된 trip 객체와 201 Created 상태 반환
                });
        })
        .catch(err => {
            // trips.json 파일이 아예 없는 경우: 파일을 생성하고 첫 트립을 저장합니다.
            if (err.code === 'ENOENT') {
                const newTripId = 1; // 첫 트립이므로 ID는 1부터 시작
                const newTrip = {
                    ...newTripRequest,
                    tripId: newTripId,
                    createdTime: new Date().toISOString(),
                };
                return fs.promises.writeFile(TRIPS_FILE, JSON.stringify([newTrip], null, 2))
                    .then(() => {
                        console.log(`trips.json created and first trip added with ID: ${newTripId}`);
                        res.status(201).json(newTrip);
                    });
            }
            console.error('SERVER ERROR during /add_trip:', err);
            res.status(500).send('SERVER ERROR while adding trip data.');
        });
});
// --- ✨ 새로운 POST /get_trip 엔드포인트 추가 ✨ ---
app.post('/get_trip', (req, res) => {
    let requestedTripId;

    // 클라이언트에서 @Body() Map<String,dynamic> tripId로 보내므로, req.body는 객체일 것
    // 요청 본문에서 'tripId' 키를 찾아 값을 추출합니다.
    if (typeof req.body === 'object' && req.body !== null && (req.body.tripId !== undefined || req.body.tripId !== null)) {
        requestedTripId = parseInt(req.body.tripId); // 정수로 변환
    } else if (typeof req.body === 'string') {
        // 혹시 모르니 문자열로 단일 ID가 왔을 경우도 대비
        try {
            const parsedBody = JSON.parse(req.body); // JSON 문자열로 왔을 경우 파싱
            if (parsedBody && (parsedBody.tripId !== undefined || parsedBody.tripId !== null)) {
                requestedTripId = parseInt(parsedBody.tripId);
            }
        } catch (e) {
            // JSON 파싱 실패 시, 문자열 자체를 ID로 시도 (fallback)
            requestedTripId = parseInt(req.body);
        }
    }

    if (isNaN(requestedTripId)) { // tripId가 유효한 숫자가 아닐 경우
        console.error('Invalid or missing tripId in request body for /get_trip:', req.body);
        return res.status(400).send('Valid tripId is required in the request body.');
    }

    // trips.json 파일 읽기
    fs.promises.readFile(TRIPS_FILE, 'utf8')
        .then(tripsData => {
            let trips = [];
            try {
                trips = JSON.parse(tripsData);
            } catch (parseErr) {
                console.error('Error parsing trips.json for /get_trip:', parseErr);
                return res.status(500).send('Trip data is corrupted or malformed.');
            }

            // 요청된 tripId에 해당하는 단일 트립을 찾음
            const foundTrip = trips.find(trip => trip.tripId == requestedTripId);

            if (!foundTrip) {
                console.log(`Trip with ID ${requestedTripId} not found.`);
                return res.status(404).send(`Trip with ID ${requestedTripId} not found.`);
            }

            console.log(`Successfully retrieved trip ID ${requestedTripId}.`);
            res.status(200).json(foundTrip); // 찾은 trip 객체 반환
        })
        .catch(err => {
            // trips.json 파일 자체가 없거나 읽기 오류 발생 시
            if (err.code === 'ENOENT') {
                console.log('trips.json not found for /get_trip, no trips to retrieve.');
                return res.status(404).send('No trip data file found.');
            }
            console.error('SERVER ERROR during /get_trip data retrieval:', err);
            return res.status(500).send('SERVER ERROR while processing trip data.');
        });
});
// --- ✨ 새로운 POST /get_trips_with_user 엔드포인트 추가 ✨ ---
app.post('/get_trips_with_user', (req, res) => {
    let requestedUserId;

    // 클라이언트에서 @Body() Map<String,dynamic> userId로 보내므로, req.body는 객체일 것
    // 요청 본문에서 'userId' 키를 찾아 값을 추출합니다.
    if (typeof req.body === 'object' && req.body !== null && (req.body.userId !== undefined || req.body.userId !== null)) {
        requestedUserId = parseInt(req.body.userId); // 정수로 변환
    } else if (typeof req.body === 'string') {
        // 혹시 모르니 문자열로 단일 ID가 왔을 경우도 대비
        try {
            const parsedBody = JSON.parse(req.body); // JSON 문자열로 왔을 경우 파싱
            if (parsedBody && (parsedBody.userId !== undefined || parsedBody.userId !== null)) {
                requestedUserId = parseInt(parsedBody.userId);
            }
        } catch (e) {
            // JSON 파싱 실패 시, 문자열 자체를 ID로 시도 (fallback)
            requestedUserId = parseInt(req.body);
        }
    }

    if (isNaN(requestedUserId)) { // userId가 유효한 숫자가 아닐 경우
        console.error('Invalid or missing userId in request body for /get_trips_with_user:', req.body);
        return res.status(400).send('Valid userId is required in the request body.');
    }

    // trips.json 파일 읽기
    fs.promises.readFile(TRIPS_FILE, 'utf8')
        .then(tripsData => {
            let trips = [];
            try {
                trips = JSON.parse(tripsData);
            } catch (parseErr) {
                console.error('Error parsing trips.json for /get_trips_with_user:', parseErr);
                // 파일 내용이 손상되었거나 유효한 JSON이 아닌 경우
                // 빈 배열을 반환하여 클라이언트가 에러 없이 처리하도록 함
                return res.status(200).json([]);
            }

            // 요청된 userId에 해당하는 모든 트립을 필터링
            const filteredTrips = trips.filter(trip => trip.userId == requestedUserId);

            console.log(`Successfully retrieved ${filteredTrips.length} trips for user ID ${requestedUserId}.`);
            res.status(200).json(filteredTrips); // 필터링된 트립 리스트 반환
        })
        .catch(err => {
            // trips.json 파일 자체가 없거나 읽기 오류 발생 시
            if (err.code === 'ENOENT') {
                console.log('trips.json not found for /get_trips_with_user, returning empty list.');
                return res.status(200).json([]); // 파일이 없으면 빈 배열 반환
            }
            console.error('SERVER ERROR during /get_trips_with_user data retrieval:', err);
            return res.status(500).send('SERVER ERROR while processing trip data.');
        });
});
app.post('/cancel_trip', (req, res) => {
    let cancelTripRequest = req.body;

    // JSON 형식 검증 및 파싱 (plain text로 오는 경우 대비)
    if (typeof cancelTripRequest === 'string') {
        try {
            cancelTripRequest = JSON.parse(cancelTripRequest);
        } catch (e) {
            console.error('Error parsing cancelTripRequest as JSON string:', e);
            return res.status(400).send('Invalid JSON format for trip cancellation. (If sending as plain text, it must be valid JSON)');
        }
    }

    // 필수 필드 유효성 검사: tripId가 반드시 필요합니다.
    if (!cancelTripRequest || cancelTripRequest.tripId === undefined || cancelTripRequest.tripId === null) {
        return res.status(400).send('Missing required tripId for cancellation.');
    }

    const requestedTripId = parseInt(cancelTripRequest.tripId);
    if (isNaN(requestedTripId)) {
        console.error('Invalid tripId in request body for /cancel_trip:', cancelTripRequest.tripId);
        return res.status(400).send('Valid tripId is required for cancellation.');
    }

    // trips.json 파일 읽기
    fs.promises.readFile(TRIPS_FILE, 'utf8')
        .then(tripsData => {
            let trips = [];
            try {
                trips = JSON.parse(tripsData);
            } catch (parseErr) {
                console.error('Error parsing trips.json for /cancel_trip:', parseErr);
                return res.status(500).send('Trip data is corrupted or malformed.');
            }

            // 요청된 tripId에 해당하는 트립을 찾음
            const tripIndex = trips.findIndex(trip => parseInt(trip.tripId) === requestedTripId);

            if (tripIndex === -1) {
                console.log(`Trip with ID ${requestedTripId} not found for cancellation.`);
                return res.status(404).send(`Trip with ID ${requestedTripId} not found.`);
            }

            // 해당 트립의 필드 업데이트
            const updatedTrip = {
                ...trips[tripIndex], // 기존 트립 정보 복사
                upcoming: false,
                complete: true, // 완료 상태로 변경
                cancelTrip: true, // 취소 상태로 변경
                cancelReason: cancelTripRequest.cancelReason || null, // 취소 사유 (없으면 null)
                lastUpdated: new Date().toISOString() // 마지막 업데이트 시간 기록
            };

            trips[tripIndex] = updatedTrip; // 배열 내 트립 정보 업데이트

            // trips.json 파일에 저장
            return fs.promises.writeFile(TRIPS_FILE, JSON.stringify(trips, null, 2))
                .then(() => {
                    console.log(`Successfully cancelled trip with ID: ${requestedTripId}.`);
                    res.status(200).json(updatedTrip); // 업데이트된 trip 객체 반환
                });
        })
        .catch(err => {
            // trips.json 파일 자체가 없거나 읽기 오류 발생 시
            if (err.code === 'ENOENT') {
                console.log('trips.json not found for /cancel_trip, no trips to cancel.');
                return res.status(404).send('No trip data file found.');
            }
            console.error('SERVER ERROR during /cancel_trip data retrieval or update:', err);
            return res.status(500).send('SERVER ERROR while processing trip cancellation.');
        });
});

// --- ✨ 서버 시작 시 트립 상태 업데이트 로직 추가 ✨ ---
async function updateTripStatusesOnStartup() {
    console.log('Server starting up: Checking and updating trip statuses...');
    const today = new Date();
    // 오늘 날짜를 YYYY-MM-DD 형식으로 포맷팅 (시간 부분은 무시하고 날짜만 비교하기 위함)
    const todayFormatted = `${today.getFullYear()}-${(today.getMonth() + 1).toString().padStart(2, '0')}-${today.getDate().toString().padStart(2, '0')}`;
    const todayDateOnly = new Date(todayFormatted); // 시간 정보 없이 날짜만으로 Date 객체 생성

    try {
        const data = await fs.promises.readFile(TRIPS_FILE, 'utf8');
        let trips = [];
        try {
            trips = JSON.parse(data);
        } catch (parseErr) {
            console.error('Error parsing trips.json on startup:', parseErr);
            console.warn('Trips data is corrupted on startup, skipping status update.');
            return; // 파싱 오류 시 업데이트 중단
        }

        let hasChanges = false; // 변경 사항이 있었는지 추적

        const updatedTrips = trips.map(trip => {
            // tripEndDate가 없거나 유효하지 않으면 건너뜀
            if (!trip.tripEndDate || typeof trip.tripEndDate !== 'string') {
                return trip;
            }

            try {
                // tripEndDate를 Date 객체로 변환 (시간 정보 없이 날짜만으로)
                const endDate = new Date(trip.tripEndDate);
                const endDateFormatted = `${endDate.getFullYear()}-${(endDate.getMonth() + 1).toString().padStart(2, '0')}-${endDate.getDate().toString().padStart(2, '0')}`;
                const endDateOnly = new Date(endDateFormatted);

                // tripEndDate가 오늘 날짜보다 이전인지 확인
                // 즉, 오늘 날짜를 기준으로 이미 종료된 트립인지 확인
                if (endDateOnly < todayDateOnly) {
                    // 이미 upcoming: false, complete: true 인지 확인하여 불필요한 변경 방지
                    if (trip.upcoming !== false || trip.complete !== true) {
                        console.log(`  - Trip ID ${trip.tripId}: End date ${trip.tripEndDate} is in the past. Setting upcoming=false, complete=true.`);
                        hasChanges = true;
                        return {
                            ...trip,
                            upcoming: false,
                            complete: true
                        };
                    }
                }
            } catch (dateParseError) {
                console.warn(`  - Warning: Could not parse tripEndDate for trip ID ${trip.tripId}: "${trip.tripEndDate}". Skipping status update for this trip.`, dateParseError);
            }
            return trip; // 변경 없음
        });

        if (hasChanges) {
            await fs.promises.writeFile(TRIPS_FILE, JSON.stringify(updatedTrips, null, 2));
            console.log('Trip statuses updated and saved to trips.json.');
        } else {
            console.log('No trip status changes needed.');
        }

    } catch (err) {
        if (err.code === 'ENOENT') {
            console.log('trips.json not found on startup, no trip statuses to update.');
        } else {
            console.error('SERVER ERROR during startup trip status update:', err);
        }
    }
}

app.listen(port, () => {
    console.log(`Server listening at http://localhost:${port}`);
    updateTripStatusesOnStartup(); // ✨ 서버 시작 후 함수 호출
});