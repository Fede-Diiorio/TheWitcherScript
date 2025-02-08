USE bestiary;

-- Lista de categorias de monstruos
CREATE OR REPLACE VIEW get_all_categories AS
SELECT
	id,
	name
FROM categories
ORDER BY id;

-- Lista de todos los botines que dejan los monstruos al cazarlos
CREATE OR REPLACE VIEW get_all_loots AS
SELECT 
	id, 
    name
FROM loots;

-- Lista con todos los monstruos del bestiario
CREATE OR REPLACE VIEW get_all_monsters AS
SELECT 
	m.id, 
    c.name AS category, 
    m.name, 
    m.ability, 
    m.description 
FROM monsters AS m
INNER JOIN categories AS c ON (c.id = m.id)
ORDER BY m.id;

-- Lista con todos los botines según el monstruo
CREATE OR REPLACE VIEW get_all_loots_by_monsters AS
SELECT 
	m.name AS monster, 
    l.name AS loot 
FROM monsters_loots AS ml
INNER JOIN monsters AS m ON (m.id = ml.monster_id)
INNER JOIN loots AS l ON (l.id = ml.loot_id)
ORDER BY monster;

-- Lista con todas las localizaciones donde se pueden encontrar los monstruos
CREATE OR REPLACE VIEW get_all_locations AS 
SELECT 
	id,
    name
FROM locations
ORDER BY id;

-- Lista con todas las localizacions según el monstruo
CREATE OR REPLACE VIEW get_all_locations_by_monster AS
SELECT 
	m.name AS monster, 
	l.name AS location
FROM monsters_locations AS ml
INNER JOIN monsters AS m ON (m.id = ml.monster_id)
INNER JOIN locations AS l ON (l.id = ml.location_id)
ORDER BY monster;

-- Lista con todas las variantes de los monstruos
CREATE OR REPLACE VIEW get_all_variations AS
SELECT 
	v.id,
	v.name, 
	m.name AS original_monster, 
	v.description
FROM variations AS v
INNER JOIN monsters AS m ON (m.id = v.monster_id)
ORDER BY id;

-- Lista con todas las categorias de las herramiestas de brujo
CREATE OR REPLACE VIEW get_all_tools_type AS
SELECT
	id,
    name
FROM tool_types
ORDER BY id;

-- Lista con todas las herramientas de brujo
CREATE OR REPLACE VIEW get_all_tools AS 
SELECT 
	t.id, 
	t.name, 
	c.name AS category
FROM tools AS t
INNER JOIN tool_types AS c ON (c.id = t.tool_type_id)
ORDER BY id;

-- Lista con todas las debilidades de cada monstruo
CREATE OR REPLACE VIEW get_all_weaknesses_by_monster AS
SELECT 
	m.name AS monster, 
	t.name AS weakness 
FROM monsters_weaknesses AS w
INNER JOIN monsters m ON (m.id = w.monster_id) 
INNER JOIN tools t ON (t.id = w.tool_id)
ORDER BY monster;

-- Lista con todas las inmunidades de cada monstruo
CREATE OR REPLACE VIEW get_all_inmunities_by_monster AS
SELECT 
	m.name AS monster, 
	t.name AS inmunity
FROM monsters_immunities AS i
INNER JOIN monsters AS m ON (m.id = i.monster_id)
INNER JOIN tools AS t ON (t.id = i.tool_id)
ORDER BY monster;