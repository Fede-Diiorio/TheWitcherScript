-- Lista de categorias de monstruos
SELECT * FROM categories;

-- Lista de todos los botines que dejan los monstruos al cazarlos
SELECT * FROM loots;

-- Lista con todos los monstruos del bestiario
SELECT m.id, c.name AS category, m.name, m.hability, m.description 
FROM monsters AS m
INNER JOIN categories AS c ON (c.id = m.id_category);

-- Lista con todos los botines según el monstruo
SELECT m.name, l.name 
FROM monsters_loots
INNER JOIN monsters AS m ON (m.id = monsters_loots.id_monster)
INNER JOIN loots AS l ON (l.id = monsters_loots.id_loot);

-- Lista con todas las localizaciones donde se pueden encontrar los monstruos
SELECT * FROM locations;

-- Lista con todas las localizacions según el monstruo
SELECT m.name, l.name
FROM monsters_locations
INNER JOIN monsters AS m ON (m.id = monsters_locations.id_monster)
INNER JOIN locations AS l ON (l.id = monsters_locations.id_location);

-- Lista con todas las variantes de los monstruos
SELECT v.id, v.name, m.name AS original_monster , v.description
FROM variations AS v
INNER JOIN monsters AS m ON (m.id = v.id_monster);

-- Lista con todas las categorias de las herramiestas de brujo
SELECT * FROM tools_type;

-- Lista con todas las herramientas de brujo
SELECT t.id, t.name, c.name AS category
FROM tools AS t
INNER JOIN tools_type AS c ON (c.id = t.id_tool_type)
ORDER BY t.id;

-- Lista con todas las debilidades de cada monstruo
SELECT m.name AS monster, t.name AS weakness 
FROM monsters_weaknesses w
INNER JOIN monsters m ON (m.id = w.id_monster) 
INNER JOIN tools t ON (t.id = w.id_tool);

-- Lista con todas las inmunidades de cada monstruo
SELECT m.name AS monster, t.name AS inmunity
FROM monsters_immunities AS i
INNER JOIN monsters AS m ON (m.id = i.id_monster)
INNER JOIN tools AS t ON (t.id = i.id_tool);