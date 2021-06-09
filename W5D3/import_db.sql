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
    ('Age', 'How old are you', (SELECT id FROM users WHERE fname = 'John'));

-------------------------------------------------------------------------------------------

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    reply VARCHAR(230) NOT NULL,
    users_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    reply_id INTEGER, 


    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    likes TEXT NOT NULL,
    users_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,


    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    replies(reply, users_id, question_id, reply_id)
VALUES
    ('I was born in PA.', 1, 1, null);



INSERT INTO
    question_likes(likes, users_id, question_id)
VALUES
    ('Age', 1, 2);
    









