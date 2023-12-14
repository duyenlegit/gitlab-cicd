// Edit the app.js file to set up the server:
const express = require('express');
const path = require('path');
const sqlite3 = require('sqlite3').verbose();

const app = express();
const port = 3000;

// Set the view engine to ejs
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Setup SQLite database
const db = new sqlite3.Database(':memory:', (err) => {
  if (err) {
    return console.error(err.message);
  }
  console.log('Connected to the in-memory SQLite database.');

  // Create a table to store example data
  db.run('CREATE TABLE IF NOT EXISTS messages (id INTEGER PRIMARY KEY, text TEXT)', (err) => {
    if (err) {
      console.error(err.message);
    }
  });
});

// Serve static files from the "public" directory
app.use(express.static(path.join(__dirname, 'public')));

// Define routes
app.get('/', (req, res) => {
  db.all('SELECT * FROM messages', [], (err, rows) => {
    if (err) {
      throw err;
    }
    res.render('index', { messages: rows });
  });
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
