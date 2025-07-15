
const express = require('express');
const app = express();
const port = 3000;

const fs = require('fs');
const DB_FILE = './users.json';

// Helper function to read the database
const readDB = () => {
  if (!fs.existsSync(DB_FILE)) {
    return [];
  }
  const data = fs.readFileSync(DB_FILE);
  return JSON.parse(data);
};

// Helper function to write to the database
const writeDB = (data) => {
  fs.writeFileSync(DB_FILE, JSON.stringify(data, null, 2));
};

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.get('/create_account', (req, res) => {
  const { id, pwd, name, profile_pic } = req.query;
  if (!id || !pwd || !name) {
    return res.status(400).send('id, pwd, name are required');
  }

  const users = readDB();
  const existingUser = users.find(user => user.id === id);
  if (existingUser) {
    return res.status(409).send('User ID already exists');
  }

  const newUser = { id, pwd, name, profile_pic };
  users.push(newUser);
  writeDB(users);

  res.status(201).send(newUser);
});

app.get('/users', (req, res) => {
  const users = readDB();
  res.json(users);
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
