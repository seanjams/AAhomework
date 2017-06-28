DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR NOT NULL,
  lname VARCHAR NOT NULL
);

DROP TABLE IF EXISTS questions;
CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR NOT NULL,
  body VARCHAR NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;
CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;
CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  parent_id INTEGER,
  body VARCHAR NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (author_id) REFERENCES questions(author_id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

DROP TABLE IF EXISTS question_likes;
CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- POPULATE USERS
INSERT INTO
  users (fname, lname)
VALUES
  ("Rarah", "Giauj"), ("Kiaje", "Poin"), ("Urina", "Hiaue");

-- POPULATE QUESTIONS
INSERT INTO
  questions (title, body, author_id)
SELECT
  "Question title 1", "Body of what was supposed to be aquestion.", users.id
FROM
  users
WHERE
  users.fname = "Rarah" AND
  users.lname = "Giauj";

INSERT INTO
  questions (title, body, author_id)
SELECT
  "Question title 2", "WHAT IS MY QUESTION", users.id
FROM
  users
WHERE
  users.fname = "Kiaje" AND
  users.lname = "Poin";

INSERT INTO
  replies (question_id, author_id, parent_id, body)
SELECT
  questions.id, 1, NULL, "Here's a reply"
FROM
  questions
WHERE
  questions.title = 'Question title 1';
