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
    category INT NOT NULL,
    name VARCHAR (50) NOT NULL,
    hability TEXT,
    description TEXT NOT NULL,
    FOREIGN KEY (category) REFERENCES categories (id) ON DELETE CASCADE
);

CREATE TABLE monsters_loots (
    id_monster INT NOT NULL,
    id_loot INT NOT NULL,
    FOREIGN KEY (id_monster) REFERENCES monsters (id) ON DELETE CASCADE,
    FOREIGN KEY (id_loot) REFERENCES loots (id) ON DELETE CASCADE
);

CREATE TABLE locations (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR (40) NOT NULL UNIQUE
);

CREATE TABLE monsters_locations (
    id_monster INT NOT NULL,
    id_location INT NOT NULL,
    FOREIGN KEY (id_monster) REFERENCES monsters (id) ON DELETE CASCADE,
    FOREIGN KEY (id_location) REFERENCES locations (id) ON DELETE CASCADE
);

CREATE TABLE variations (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR (50) NOT NULL UNIQUE,
    description TEXT NOT NULL,
    monster INT NOT NULL,
    FOREIGN KEY (monster) REFERENCES monsters (id) ON DELETE CASCADE
);

CREATE TABLE tools_type (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR (15) NOT NULL UNIQUE
);

CREATE TABLE tools (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR (75) NOT NULL UNIQUE,
    type INT NOT NULL,
    FOREIGN KEY (type) REFERENCES tools_type (id) ON DELETE CASCADE
);

CREATE TABLE monsters_tools (
    id_monster INT NOT NULL,
    id_tool_weakness INT NOT NULL,
    id_tool_inmunity INT,
    FOREIGN KEY (id_monster) REFERENCES monsters (id) ON DELETE CASCADE,
    FOREIGN KEY (id_tool_weakness) REFERENCES tools (id) ON DELETE CASCADE,
    FOREIGN KEY (id_tool_inmunity) REFERENCES tools (id) ON DELETE CASCADE
);