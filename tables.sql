CREATE DATABASE IF NOT EXISTS bestiary;
USE bestiary;

CREATE TABLE categories (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR (30) NOT NULL
);

CREATE TABLE locations (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR (40) NOT NULL,
    climate VARCHAR(20) NOT NULL
);

CREATE TABLE monsters (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    category INT NOT NULL,
    location INT NOT NULL,
    name VARCHAR (50) NOT NULL,
    hability VARCHAR (150),
    FOREIGN KEY (category) REFERENCES categories (id) ON DELETE CASCADE,
    FOREIGN KEY (location) REFERENCES locations (id) ON DELETE CASCADE
);

CREATE TABLE loots (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR (100) NOT NULL
);

CREATE TABLE weaknesses_type (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR (15) NOT NULL
);

CREATE TABLE weaknesses (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR (75) NOT NULL,
    type INT NOT NULL,
    FOREIGN KEY (type) REFERENCES weaknesses_type (id) ON DELETE CASCADE
);

CREATE TABLE monsters_weaknesses (
    id_monster INT NOT NULL,
    id_weakness INT NOT NULL,
    FOREIGN KEY (id_monster) REFERENCES monsters (id) ON DELETE CASCADE,
    FOREIGN KEY (id_weakness) REFERENCES weaknesses (id) ON DELETE CASCADE
);

CREATE TABLE monsters_loots (
    id_monster INT NOT NULL,
    id_loot INT NOT NULL,
    FOREIGN KEY (id_monster) REFERENCES monsters (id) ON DELETE CASCADE,
    FOREIGN KEY (id_loot) REFERENCES loots (id) ON DELETE CASCADE
);