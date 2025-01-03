CREATE DATABASE IF NOT EXISTS bestiary;
USE bestiary;

CREATE TABLE categories (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR (30) NOT NULL UNIQUE
);

CREATE TABLE loots (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR (100) NOT NULL UNIQUE
);

CREATE TABLE monsters (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_category INT NOT NULL,
    name VARCHAR (50) NOT NULL,
    hability TEXT,
    description TEXT NOT NULL,
    FOREIGN KEY (id_category) REFERENCES categories (id) ON DELETE CASCADE
);

CREATE TABLE monsters_loots (
    id_monster INT NOT NULL,
    id_loot INT NOT NULL,
    FOREIGN KEY (id_monster) REFERENCES monsters (id) ON DELETE CASCADE,
    FOREIGN KEY (id_loot) REFERENCES loots (id) ON DELETE CASCADE
);

CREATE TABLE locations (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR (60) NOT NULL UNIQUE
);

CREATE TABLE monsters_locations (
    id_monster INT NOT NULL,
    id_location INT NOT NULL,
    FOREIGN KEY (id_monster) REFERENCES monsters (id) ON DELETE CASCADE,
    FOREIGN KEY (id_location) REFERENCES locations (id) ON DELETE CASCADE
);

CREATE TABLE variations (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_monster INT NOT NULL,
    name VARCHAR (50) NOT NULL UNIQUE,
    description TEXT NOT NULL,
    FOREIGN KEY (id_monster) REFERENCES monsters (id) ON DELETE CASCADE
);

CREATE TABLE tools_type (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR (15) NOT NULL UNIQUE
);

CREATE TABLE tools (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR (75) NOT NULL UNIQUE,
    id_type INT NOT NULL,
    FOREIGN KEY (id_type) REFERENCES tools_type (id) ON DELETE CASCADE
);

CREATE TABLE monsters_weaknesses (
    id_monster INT NOT NULL,
    id_tool INT NOT NULL,
    FOREIGN KEY (id_monster) REFERENCES monsters (id) ON DELETE CASCADE,
    FOREIGN KEY (id_tool) REFERENCES tools (id) ON DELETE CASCADE
);

CREATE TABLE monsters_immunities (
    id_monster INT NOT NULL,
    id_tool INT NOT NULL,
    FOREIGN KEY (id_monster) REFERENCES monsters (id) ON DELETE CASCADE,
    FOREIGN KEY (id_tool) REFERENCES tools (id) ON DELETE CASCADE
);