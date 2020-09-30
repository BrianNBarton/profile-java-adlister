USE adlister_db;

DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS ads_categories;
DROP TABLE IF EXISTS categories;

CREATE TABLE users
(
    id       INT UNSIGNED        NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) UNIQUE NOT NULL,
    email    VARCHAR(240)        NOT NULL,
    password VARCHAR(255)        NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id     INT UNSIGNED NOT NULL,
    title       VARCHAR(240) NOT NULL,
    description TEXT         NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
        ON DELETE CASCADE
);

# Linking table from ads to categories
CREATE TABLE ads_categories
(
    ad_id       INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED,
    FOREIGN KEY (ad_id) REFERENCES ads (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);

# Create the categories table
CREATE TABLE categories
(
    id            INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(240),
    PRIMARY KEY (id)
);
