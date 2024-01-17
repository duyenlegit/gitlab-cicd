const express = require('express');
const path = require('path');
const sqlite3 = require('sqlite3').verbose();

const app = express();
const port = 3000;

// Express configuration
app.use(express.urlencoded({ extended: false })); // Middleware to parse form data
app.set('view engine', 'ejs'); // Set the view engine to ejs
app.set('views', path.join(__dirname, 'views')); // Set the views directory

// Database setup
const db = new sqlite3.Database(':memory:');
db.run('CREATE TABLE IF NOT EXISTS messages (id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT)');

// Serve static files from the "public" directory
app.use(express.static(path.join(__dirname, 'public')));

// GET route for home page which displays all messages
app.get('/', (req, res) => {
  db.all('SELECT * FROM messages', [], (err, rows) => {
    if (err) {
      return console.error(err.message);
    }
    res.render('index', { messages: rows });
  });
});

// POST route to add a new message
app.post('/add-message', (req, res) => {
  const text = req.body.text;
  db.run('INSERT INTO messages (text) VALUES (?)', [text], function(err) {
    if (err) {
      return console.error(err.message);
    }
    console.log(`A row has been inserted with rowid ${this.lastID}`);
    res.redirect('/');
  });
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running at <http://localhost>:${port}`);
});