CREATE SCHEMA IF NOT EXISTS bestiary;
USE bestiary;

CREATE TABLE IF NOT EXISTS categories (
    id_category INT AUTO_INCREMENT,
    name VARCHAR (30) NOT NULL UNIQUE,
    CONSTRAINT pk_categories PRIMARY KEY (id_category)
);

CREATE TABLE IF NOT EXISTS loots (
    id_loot INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    CONSTRAINT pk_loots PRIMARY KEY (id_loot)
);

CREATE TABLE IF NOT EXISTS monsters (
    id_monster INT AUTO_INCREMENT,
    id_category INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    hability TEXT,
    description TEXT NOT NULL,
    CONSTRAINT pk_monsters PRIMARY KEY (id_monster),
    CONSTRAINT fk_monsters_categories FOREIGN KEY (id_category) REFERENCES categories (id_category)
);

CREATE TABLE IF NOT EXISTS monsters_loots (
    id_monster INT NOT NULL,
    id_loot INT NOT NULL,
    CONSTRAINT pk_monsters_loots PRIMARY KEY (id_monster, id_loot),
    CONSTRAINT fk_monsters_loots FOREIGN KEY (id_monster) REFERENCES monsters (id_monster) ON DELETE CASCADE,
    CONSTRAINT fk_loots FOREIGN KEY (id_loot) REFERENCES loots (id_loot) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS locations (
    id_location INT AUTO_INCREMENT,
    name VARCHAR (60) NOT NULL UNIQUE,
    CONSTRAINT pk_locations PRIMARY KEY (id_location)
);

CREATE TABLE IF NOT EXISTS monsters_locations (
    id_monster INT NOT NULL,
    id_location INT NOT NULL,
    CONSTRAINT pk_monsters_locations PRIMARY KEY (id_monster, id_location),
    CONSTRAINT fk_monsters_locations FOREIGN KEY (id_monster) REFERENCES monsters (id_monster) ON DELETE CASCADE,
    CONSTRAINT fk_locations FOREIGN KEY (id_location) REFERENCES locations (id_location) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS variations (
    id_variation INT AUTO_INCREMENT,
    id_monster INT NOT NULL,
    name VARCHAR (50) NOT NULL UNIQUE,
    description TEXT NOT NULL,
    CONSTRAINT pk_variations PRIMARY KEY (id_variation),
    CONSTRAINT fk_monsters_variations FOREIGN KEY (id_monster) REFERENCES monsters (id_monster) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tools_type (
    id_tool_type INT AUTO_INCREMENT,
    name VARCHAR (15) NOT NULL UNIQUE,
    CONSTRAINT pk_tools_type PRIMARY KEY (id_tool_type)
);

CREATE TABLE IF NOT EXISTS tools (
    id_tool INT AUTO_INCREMENT,
    name VARCHAR (75) NOT NULL UNIQUE,
    id_tool_type INT NOT NULL,
    CONSTRAINT pk_tools PRIMARY KEY (id_tool),
    CONSTRAINT fk_tools_type FOREIGN KEY (id_tool_type) REFERENCES tools_type (id_tool_type) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS monsters_weaknesses (
    id_monster INT NOT NULL,
    id_tool INT NOT NULL,
    CONSTRAINT pk_monsters_weaknesses PRIMARY KEY (id_monster, id_tool),
    CONSTRAINT fk_monsters_weaknesses FOREIGN KEY (id_monster) REFERENCES monsters (id_monster) ON DELETE CASCADE,
    CONSTRAINT fk_tool_weaknesses FOREIGN KEY (id_tool) REFERENCES tools (id_tool) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS monsters_immunities (
    id_monster INT NOT NULL,
    id_tool INT NOT NULL,
    CONSTRAINT pk_monsters_immunities PRIMARY KEY (id_monster, id_tool),
    CONSTRAINT fk_monsters_inmunities FOREIGN KEY (id_monster) REFERENCES monsters (id_monster) ON DELETE CASCADE,
    CONSTRAINT fk_tool_inmunities FOREIGN KEY (id_tool) REFERENCES tools (id_tool) ON DELETE CASCADE
);