USE adlister_db;

SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE ads_categories;
TRUNCATE TABLE ads;
TRUNCATE TABLE categories;
TRUNCATE TABLE users;

INSERT INTO users (username, email, password)
VALUES ('buychromatica', 'buychromatica@codeup.com', 'password123'),
       ('jesserg3', 'jgarza11@codeup.com', 'mega01234'),
       ('timothy', 'tim@codeup.com', 'locked123'),
       ('megamind', 'Brianb@codeup.com', 'megaBrian100')
;

INSERT INTO ads (user_id, title, description)
VALUES (2, 'playstation for sale', 'This is a slightly used playstation'),
       (3, 'Super Nintendo', 'Get your game on with this old-school classic!'),
       (1, 'Junior Java Developer Position',
        'Minimum 7 years of experience required. You will be working in the scripting language for Java, JavaScript'),
       (4, 'JavaScript Developer needed', 'Must have strong Java skills');

INSERT INTO ads_categories (ad_id, category_id)
VALUES (1, 1),
       (1, 2),
       (2, 1),
       (2, 4),
       (3, 5),
       (3, 2),
       (4, 3),
       (4, 4);

INSERT INTO categories (category_name)
VALUES ('computer'),
       ('automotive'),
       ('pet'),
       ('connections'),
       ('housing');