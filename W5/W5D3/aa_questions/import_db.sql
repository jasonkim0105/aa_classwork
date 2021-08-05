PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;


CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT,
  lname TEXT
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT,
  body TEXT,
  users_id INTEGER NOT NULL,

  FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  users_id INTEGER NOT NULL,

  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT,
  users_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,

  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  users_id INTEGER NOT NULL,

  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO 
    users (fname, lname)
VALUES
    ('Jimmy', 'Kuang'),
    ('Jason', 'Kim');

INSERT INTO
    questions (title, body, users_id)
VALUES
    ("What is the more popular dog breed?", "Golden retriever or Maltese?", (SELECT id FROM users WHERE fname = 'Jimmy' AND lname = 'Kuang')),
    ("Best fast food restaurant?", "In - N - Out or Taco Bell?", (SELECT id FROM users WHERE fname = 'Jason' and lname = 'Kim'));

INSERT INTO
    question_follows (question_id, users_id)
VALUES
    ((SELECT id FROM questions WHERE title LIKE('%dog%')),(SELECT id FROM users WHERE fname = 'Jimmy' AND lname = 'Kuang')),
    ((SELECT id FROM questions WHERE title LIKE('%dog%')),(SELECT id FROM users WHERE fname = 'Jason' AND lname = 'Kim')),
    ((SELECT id FROM questions WHERE title LIKE ('%restaurant%')),(SELECT id FROM users WHERE fname = 'Jason' AND lname = 'Kim'));

INSERT INTO
    replies (body, users_id, question_id, parent_id)
VALUES
    ("Golden Retriever", (SELECT id FROM users WHERE fname = 'Jason' AND lname = 'Kim'),(SELECT id FROM questions WHERE title LIKE('%dog%')), NULL);

INSERT INTO
    replies (body, users_id, question_id, parent_id)
VALUES
    ("BOOO", (SELECT id FROM users WHERE fname = 'Jimmy' AND lname = 'Kuang'), (SELECT id FROM questions WHERE title LIKE('%dog%')), (SELECT id FROM replies WHERE body LIKE 'Golden Retriever'));

INSERT INTO
    replies (body, users_id, question_id, parent_id)
VALUES
    ("In - N - Out", (SELECT id FROM users WHERE fname = 'Jimmy' AND lname = 'Kuang'), (SELECT id FROM questions WHERE title LIKE('%restaurant%')), NULL);

INSERT INTO
    question_likes (question_id, users_id)
VALUES
    ((SELECT id FROM questions WHERE title LIKE('%dog%')),(SELECT id FROM users WHERE fname = 'Jimmy' AND lname = 'Kuang')),
    ((SELECT id FROM questions WHERE title LIKE('%dog%')),(SELECT id FROM users WHERE fname = 'Jason' AND lname = 'Kim')),
    ((SELECT id FROM questions WHERE title LIKE ('%restaurant%')),(SELECT id FROM users WHERE fname = 'Jason' AND lname = 'Kim'));
