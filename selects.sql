-- Lista con los botines que más arrojan los monstruos
SELECT l.name AS loot, COUNT(*) AS count
FROM monsters_loots AS ml
INNER JOIN loots AS l ON (l.id_loot = ml.id_loot)
GROUP BY l.name
ORDER BY count DESC;

-- Lista con las localizaciones con más variedad de monstruos
SELECT l.name AS location, COUNT(*) AS monsters_quantity
FROM monsters_locations AS ml
INNER JOIN locations AS l on (l.id_location = ml.id_location)
GROUP BY l.name
ORDER BY monsters_quantity DESC;

-- Lista con las herramientas que afecta a más monsturos
SELECT t.name AS tool, COUNT(*) AS count
FROM monsters_weaknesses AS w
INNER JOIN tools AS t ON (t.id_tool = w.id_tool)
GROUP BY t.name
HAVING COUNT(*) >= 2
ORDER BY count DESC;