USE bestiary;

-- Lista de categorias de monstruos
CREATE OR REPLACE VIEW get_all_categories AS
SELECT
	id_category AS id,
	name
FROM categories
ORDER BY id_category;

-- Lista de todos los botines que dejan los monstruos al cazarlos
CREATE OR REPLACE VIEW get_all_loots AS
SELECT 
	id_loot AS id, 
    name
FROM loots;

-- Lista con todos los monstruos del bestiario
CREATE OR REPLACE VIEW get_all_monsters AS
SELECT 
	m.id_monster, 
    c.name AS category, 
    m.name, 
    m.hability, 
    m.description 
FROM monsters AS m
INNER JOIN categories AS c ON (c.id_category = m.id_category)
ORDER BY m.id_monster;

-- Lista con todos los botines según el monstruo
CREATE OR REPLACE VIEW get_all_loots_by_monsters AS
SELECT 
	m.name AS monster, 
    l.name AS loot 
FROM monsters_loots AS ml
INNER JOIN monsters AS m ON (m.id_monster = ml.id_monster)
INNER JOIN loots AS l ON (l.id_loot = ml.id_loot)
ORDER BY monster;

-- Lista con todas las localizaciones donde se pueden encontrar los monstruos
CREATE OR REPLACE VIEW get_all_locations AS 
SELECT 
	id_location AS id,
    name
FROM locations
ORDER BY id;

-- Lista con todas las localizacions según el monstruo
CREATE OR REPLACE VIEW get_all_locations_by_monster AS
SELECT 
	m.name AS monster, 
	l.name AS location
FROM monsters_locations AS ml
INNER JOIN monsters AS m ON (m.id_monster = ml.id_monster)
INNER JOIN locations AS l ON (l.id_location = ml.id_location)
ORDER BY monster;

-- Lista con todas las variantes de los monstruos
CREATE OR REPLACE VIEW get_all_variations AS
SELECT 
	v.id_variation AS id,
	v.name, 
	m.name AS original_monster , 
	v.description
FROM variations AS v
INNER JOIN monsters AS m ON (m.id_monster = v.id_monster)
ORDER BY id;

-- Lista con todas las categorias de las herramiestas de brujo
CREATE OR REPLACE VIEW get_all_tools_type AS
SELECT
	id_tool_type AS id,
    name
FROM tools_type
ORDER BY id;

-- Lista con todas las herramientas de brujo
CREATE OR REPLACE VIEW get_all_tools AS 
SELECT 
	t.id_tool AS id, 
	t.name, 
	c.name AS category
FROM tools AS t
INNER JOIN tools_type AS c ON (c.id_tool_type = t.id_tool_type)
ORDER BY id;

-- Lista con todas las debilidades de cada monstruo
CREATE OR REPLACE VIEW get_all_weaknesses_by_monster AS
SELECT 
	m.name AS monster, 
	t.name AS weakness 
FROM monsters_weaknesses AS w
INNER JOIN monsters m ON (m.id_monster = w.id_monster) 
INNER JOIN tools t ON (t.id_tool = w.id_tool)
ORDER BY monster;

-- Lista con todas las inmunidades de cada monstruo
CREATE OR REPLACE VIEW get_all_inmunities_by_monster AS
SELECT 
	m.name AS monster, 
	t.name AS inmunity
FROM monsters_immunities AS i
INNER JOIN monsters AS m ON (m.id_monster = i.id_monster)
INNER JOIN tools AS t ON (t.id_tool = i.id_tool)
ORDER BY monster;