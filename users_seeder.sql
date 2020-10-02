## RUN FILE FROM TERMINAL: mysql -p -t < users_seeder.sql

USE adlister_db;

INSERT INTO users
(username, email, password)
VALUES
('admin', 'admin@megami.nd', 'superman'),
('brian', 'brian@megami.nd', 'barton'),
('jesse', 'jesse@megami.nd', 'garza'),
('tim', 'tim@megami.nd', 'boudreaux'),
('trevor', 'trevor@megami.nd', 'arnold');
SELECT * FROM users;

DS