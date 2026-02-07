SELECT
    information_schema.tables.table_name AS 'Таблицы',
    GROUP_CONCAT(DISTINCT information_schema.columns.column_name) AS 'Столбцы',
    GROUP_CONCAT(DISTINCT information_schema.statistics.index_name) AS 'Индексы'
FROM information_schema.tables
INNER JOIN information_schema.columns
    ON information_schema.tables.table_name = information_schema.columns.table_name
INNER JOIN information_schema.statistics
    ON information_schema.tables.table_name = information_schema.statistics.table_name
WHERE
    information_schema.tables.table_schema = 'studding_process_db'
    AND index_name <> 'PRIMARY'
GROUP BY
    information_schema.tables.table_name
UNION ALL
SELECT
    (SELECT COUNT(*)
     FROM information_schema.tables
     WHERE table_schema = 'studding_process_db'),
    (SELECT COUNT(information_schema.columns.column_name)
     FROM information_schema.columns
     WHERE table_schema = 'studding_process_db'),
    (SELECT COUNT(information_schema.statistics.index_name)
     FROM information_schema.statistics
     WHERE table_schema = 'studding_process_db'
     AND index_name <> 'PRIMARY');

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'studding_process_db'
ORDER BY table_name;

SELECT table_name, index_name
FROM information_schema.statistics
WHERE table_schema = 'studding_process_db'
    AND index_name <> 'PRIMARY'
ORDER BY table_name, index_name;

SELECT user, host
FROM mysql.user
WHERE user LIKE 'rl_%';
