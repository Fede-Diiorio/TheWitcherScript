-- Creación del esquema
CREATE SCHEMA IF NOT EXISTS bestiary;
USE bestiary;

-- Tabla de categorías
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL UNIQUE,
    CONSTRAINT pk_categories PRIMARY KEY (id)
);

-- Tabla de botines
CREATE TABLE IF NOT EXISTS loots (
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    CONSTRAINT pk_loots PRIMARY KEY (id)
);

-- Tabla de monstruos
CREATE TABLE IF NOT EXISTS monsters (
    id INT AUTO_INCREMENT,
    category_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    ability TEXT,
    description TEXT NOT NULL,
    CONSTRAINT pk_monsters PRIMARY KEY (id),
    CONSTRAINT fk_monsters_category FOREIGN KEY (category_id) REFERENCES categories (id)
);

-- Tabla intermedia de monstruos y botines
CREATE TABLE IF NOT EXISTS monsters_loots (
    monster_id INT NOT NULL,
    loot_id INT NOT NULL,
    CONSTRAINT pk_monsters_loots PRIMARY KEY (monster_id, loot_id),
    CONSTRAINT fk_monsters_loots_monster FOREIGN KEY (monster_id) REFERENCES monsters (id) ON DELETE CASCADE,
    CONSTRAINT fk_monsters_loots_loot FOREIGN KEY (loot_id) REFERENCES loots (id) ON DELETE CASCADE
);

-- Tabla de ubicaciones
CREATE TABLE IF NOT EXISTS locations (
    id INT AUTO_INCREMENT,
    name VARCHAR(60) NOT NULL UNIQUE,
    CONSTRAINT pk_locations PRIMARY KEY (id)
);

-- Tabla intermedia de monstruos y ubicaciones
CREATE TABLE IF NOT EXISTS monsters_locations (
    monster_id INT NOT NULL,
    location_id INT NOT NULL,
    CONSTRAINT pk_monsters_locations PRIMARY KEY (monster_id, location_id),
    CONSTRAINT fk_monsters_locations_monster FOREIGN KEY (monster_id) REFERENCES monsters (id) ON DELETE CASCADE,
    CONSTRAINT fk_monsters_locations_location FOREIGN KEY (location_id) REFERENCES locations (id) ON DELETE CASCADE
);

-- Tabla de variaciones de monstruos
CREATE TABLE IF NOT EXISTS variations (
    id INT AUTO_INCREMENT,
    monster_id INT NOT NULL,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT NOT NULL,
    CONSTRAINT pk_variations PRIMARY KEY (id),
    CONSTRAINT fk_variations_monster FOREIGN KEY (monster_id) REFERENCES monsters (id) ON DELETE CASCADE
);

-- Tabla de tipos de herramientas
CREATE TABLE IF NOT EXISTS tool_types (
    id INT AUTO_INCREMENT,
    name VARCHAR(15) NOT NULL UNIQUE,
    CONSTRAINT pk_tool_types PRIMARY KEY (id)
);

-- Tabla de herramientas
CREATE TABLE IF NOT EXISTS tools (
    id INT AUTO_INCREMENT,
    name VARCHAR(75) NOT NULL UNIQUE,
    tool_type_id INT NOT NULL,
    CONSTRAINT pk_tools PRIMARY KEY (id),
    CONSTRAINT fk_tools_tool_type FOREIGN KEY (tool_type_id) REFERENCES tool_types (id) ON DELETE CASCADE
);

-- Tabla intermedia de debilidades de monstruos
CREATE TABLE IF NOT EXISTS monsters_weaknesses (
    monster_id INT NOT NULL,
    tool_id INT NOT NULL,
    CONSTRAINT pk_monsters_weaknesses PRIMARY KEY (monster_id, tool_id),
    CONSTRAINT fk_monsters_weaknesses_monster FOREIGN KEY (monster_id) REFERENCES monsters (id) ON DELETE CASCADE,
    CONSTRAINT fk_monsters_weaknesses_tool FOREIGN KEY (tool_id) REFERENCES tools (id) ON DELETE CASCADE
);

-- Tabla intermedia de inmunidades de monstruos
CREATE TABLE IF NOT EXISTS monsters_immunities (
    monster_id INT NOT NULL,
    tool_id INT NOT NULL,
    CONSTRAINT pk_monsters_immunities PRIMARY KEY (monster_id, tool_id),
    CONSTRAINT fk_monsters_immunities_monster FOREIGN KEY (monster_id) REFERENCES monsters (id) ON DELETE CASCADE,
    CONSTRAINT fk_monsters_immunities_tool FOREIGN KEY (tool_id) REFERENCES tools (id) ON DELETE CASCADE
);
