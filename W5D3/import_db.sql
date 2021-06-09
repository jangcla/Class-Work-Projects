CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    follower_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);

INSERT INTO
    users(fname, lname)
VALUES
    ('Sam', 'Song'),
    ('John', 'Angcla');


INSERT INTO
    questions(title, body, author_id)
VALUES
    ('Birthplace', 'Where were you born?', (SELECT id FROM users WHERE fname = 'Sam')),
    ('Age', 'How old are you', (SELECT id FROM users WHERE fname = 'John'))

-------------------------------------------------------------------------------------------

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,

    reply VARCHAR(230) NOT NULL,
    question_id
);

INSERT INTO
    replies(parent_question, reply, reply_id)
VALUES
    (1, "asdfjkldaf", 123)
