SELECT table_name, table_schema
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;

SELECT COUNT(*) as "Количество таблиц"
FROM information_schema.tables
WHERE table_schema = 'public';

SELECT schemaname, tablename, indexname, indexdef
FROM pg_indexes
WHERE schemaname = 'public'
AND indexname NOT LIKE 'pk_%'
ORDER BY tablename, indexname;

SELECT COUNT(*) as "Количество индексов"
FROM pg_indexes
WHERE schemaname = 'public'
AND indexname NOT LIKE 'pk_%';

SELECT tablename, COUNT(*) as "Кол-во индексов"
FROM pg_indexes
WHERE schemaname = 'public'
GROUP BY tablename
ORDER BY tablename;

SELECT rolname, rolcanlogin, rolbypassrls, rolsuper
FROM pg_roles
WHERE rolname LIKE 'rl_%'
ORDER BY rolname;

SELECT grantee, table_name, privilege_type
FROM information_schema.table_privileges
WHERE table_schema = 'public'
ORDER BY grantee, table_name, privilege_type;

SELECT table_name, privilege_type
FROM information_schema.table_privileges
WHERE grantee = 'rl_architect'
AND table_schema = 'public'
ORDER BY table_name, privilege_type;

SELECT table_name, column_name, ordinal_position, column_default, is_nullable, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY table_name, ordinal_position;

SELECT constraint_name, table_name, column_name, referenced_table_name, referenced_column_name
FROM information_schema.referential_constraints
JOIN information_schema.key_column_usage USING (constraint_name)
WHERE constraint_schema = 'public';

SELECT table_name, column_name, constraint_name
FROM information_schema.key_column_usage
WHERE constraint_schema = 'public'
AND constraint_name LIKE 'pk_%'
ORDER BY table_name;

SELECT
    information_schema.tables.table_name as "Таблицы", 
    string_agg(DISTINCT information_schema.columns.column_name, ', ') as "Столбцы",
    string_agg(DISTINCT pg_indexes.indexname, ', ') as "Индексы"
FROM information_schema.tables
    INNER JOIN information_schema.columns
        ON information_schema.columns.table_name = information_schema.tables.table_name
    LEFT JOIN pg_indexes 
        ON information_schema.tables.table_name = pg_indexes.tablename
WHERE information_schema.tables.table_schema = 'public'
GROUP BY information_schema.tables.table_name
ORDER BY table_name;

SELECT 
    (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public') as "Таблиц",
    (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'public') as "Столбцов",
    (SELECT COUNT(*) FROM pg_indexes WHERE schemaname = 'public' AND indexname NOT LIKE 'pk_%') as "Индексов",
    (SELECT COUNT(*) FROM pg_roles WHERE rolname LIKE 'rl_%') as "Ролей";

INSERT INTO Department (Name_Department) VALUES 
('Кафедра ИВТ'),
('Кафедра ПО'),
('Кафедра МОП')
ON CONFLICT DO NOTHING;

INSERT INTO Post (Name_Post) VALUES 
('Профессор'),
('Доцент'),
('Ассистент')
ON CONFLICT DO NOTHING;

INSERT INTO Territory (Name_Territory) VALUES 
('Корпус А'),
('Корпус Б'),
('Корпус В')
ON CONFLICT DO NOTHING;

INSERT INTO Audience (Number_Audience) VALUES 
('101'),
('102'),
('103'),
('201'),
('202')
ON CONFLICT DO NOTHING;

SELECT * FROM Department;
SELECT * FROM Post;
SELECT * FROM Territory;
SELECT * FROM Audience;

SELECT sg.* FROM Study_Grpoup sg
LEFT JOIN WrkCrr wc ON sg.WrkCrr_ID = wc.ID_WrkCrr
WHERE wc.ID_WrkCrr IS NULL;

SELECT br.* FROM Bussines_Role br
LEFT JOIN Department d ON br.Department_ID = d.ID_Department
WHERE d.ID_Department IS NULL;

SELECT
    schemaname,
    tablename,
    pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) as size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC;

SELECT 
    sequence_name,
    data_type,
    start_value,
    minimum_value,
    maximum_value,
    increment,
    cycle_option
FROM information_schema.sequences
WHERE sequence_schema = 'public'
ORDER BY sequence_name;

SELECT 
    sequence_name,
    last_value
FROM information_schema.sequences
WHERE sequence_schema = 'public'
ORDER BY sequence_name;
