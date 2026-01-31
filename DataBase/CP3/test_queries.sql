-- ========================================
-- КТ № 3. PostgreSQL. Реализация таблиц
-- ПРИМЕРЫ SQL ЗАПРОСОВ ДЛЯ ТЕСТИРОВАНИЯ
-- ========================================

-- ========================================
-- 1. ПРОВЕРКА ВСЕХ ТАБЛИЦ
-- ========================================

-- Список всех созданных таблиц
SELECT 
    table_name,
    table_schema
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;

-- Количество таблиц
SELECT COUNT(*) as "Количество таблиц"
FROM information_schema.tables
WHERE table_schema = 'public';

-- ========================================
-- 2. ПРОВЕРКА ИНДЕКСОВ
-- ========================================

-- Все индексы (кроме PRIMARY KEY)
SELECT 
    schemaname,
    tablename,
    indexname,
    indexdef
FROM pg_indexes
WHERE schemaname = 'public'
AND indexname NOT LIKE 'pk_%'
ORDER BY tablename, indexname;

-- Количество индексов
SELECT COUNT(*) as "Количество индексов"
FROM pg_indexes
WHERE schemaname = 'public'
AND indexname NOT LIKE 'pk_%';

-- Индексы для каждой таблицы
SELECT 
    tablename,
    COUNT(*) as "Кол-во индексов"
FROM pg_indexes
WHERE schemaname = 'public'
GROUP BY tablename
ORDER BY tablename;

-- ========================================
-- 3. ПРОВЕРКА РОЛЕЙ
-- ========================================

-- Все созданные роли
SELECT 
    rolname,
    rolcanlogin,
    rolbypassrls,
    rolsuper
FROM pg_roles
WHERE rolname LIKE 'rl_%'
ORDER BY rolname;

-- Права доступа для каждой роли
SELECT 
    grantee,
    table_name,
    privilege_type
FROM information_schema.table_privileges
WHERE table_schema = 'public'
ORDER BY grantee, table_name, privilege_type;

-- Права для конкретной роли (rl_architect)
SELECT 
    table_name,
    privilege_type
FROM information_schema.table_privileges
WHERE grantee = 'rl_architect'
AND table_schema = 'public'
ORDER BY table_name, privilege_type;

-- ========================================
-- 4. ИНФОРМАЦИЯ О СТРУКТУРЕ ТАБЛИЦ
-- ========================================

-- Информация о всех столбцах
SELECT 
    table_name,
    column_name,
    ordinal_position,
    column_default,
    is_nullable,
    data_type,
    character_maximum_length
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY table_name, ordinal_position;

-- Таблицы с внешними ключами
SELECT
    constraint_name,
    table_name,
    column_name,
    referenced_table_name,
    referenced_column_name
FROM information_schema.referential_constraints
JOIN information_schema.key_column_usage USING (constraint_name)
WHERE constraint_schema = 'public';

-- PRIMARY KEYS
SELECT
    table_name,
    column_name,
    constraint_name
FROM information_schema.key_column_usage
WHERE constraint_schema = 'public'
AND constraint_name LIKE 'pk_%'
ORDER BY table_name;

-- ========================================
-- 5. СТАТИСТИКА И ИНФОРМАЦИЯ
-- ========================================

-- Полная информация по объектам БД
SELECT
    information_schema.tables.table_name as "Таблицы", 
    string_agg(DISTINCT information_schema.columns.column_name, ', ') as "Столбцы",
    string_agg(DISTINCT pg_indexes.indexname, ', ') as "Индексы"
FROM information_schema.tables
    INNER JOIN information_schema.columns
        ON information_schema.columns.table_name = information_schema.tables.table_name
    LEFT JOIN pg_indexes 
        ON information_schema.tables.table_name = pg_indexes.tablename
WHERE 
    information_schema.tables.table_schema = 'public'
GROUP BY information_schema.tables.table_name
ORDER BY table_name;

-- Общая статистика
SELECT 
    (SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public') as "Таблиц",
    (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = 'public') as "Столбцов",
    (SELECT COUNT(*) FROM pg_indexes WHERE schemaname = 'public' AND indexname NOT LIKE 'pk_%') as "Индексов",
    (SELECT COUNT(*) FROM pg_roles WHERE rolname LIKE 'rl_%') as "Ролей";

-- ========================================
-- 6. ПРИМЕРЫ ТЕСТИРОВАНИЯ ПРАВ ДОСТУПА
-- ========================================

-- Тест для rl_architect
-- ДОЛЖНО РАБОТАТЬ:
-- SET ROLE rl_architect;
-- SELECT * FROM Department;
-- INSERT INTO Department (Name_Department) VALUES ('Кафедра ИВТ');
-- UPDATE Department SET Name_Department = 'Кафедра ПОИТ' WHERE ID_Department = 1;

-- НЕ ДОЛЖНО РАБОТАТЬ:
-- DELETE FROM Department WHERE ID_Department = 1;
-- SELECT * FROM Territory;

-- Тест для rl_teacher
-- ДОЛЖНО РАБОТАТЬ:
-- SET ROLE rl_teacher;
-- SELECT * FROM Schedule;
-- SELECT * FROM Student;
-- UPDATE User_Profile SET U_Surname = 'Новая фамилия' WHERE UP_Login = 'teacher1';

-- НЕ ДОЛЖНО РАБОТАТЬ:
-- INSERT INTO Department (Name_Department) VALUES ('Новая кафедра');
-- SELECT * FROM Bussines_Role;

-- Тест для rl_student
-- ДОЛЖНО РАБОТАТЬ:
-- SET ROLE rl_student;
-- SELECT * FROM Schedule;
-- UPDATE Student SET Credit_Card_N = '1234567890123' WHERE Login_Student = 'student1';

-- НЕ ДОЛЖНО РАБОТАТЬ:
-- DELETE FROM Student;
-- SELECT * FROM Employee;

-- Тест для rl_managersd
-- ДОЛЖНО РАБОТАТЬ:
-- SET ROLE rl_managersd;
-- SELECT * FROM Study_Grpoup;
-- INSERT INTO Study_Grpoup (Name_St_Grp, Date_Create_SG, WrkCrr_ID) VALUES ('ГР-101', '2026-01-31', 1);

-- НЕ ДОЛЖНО РАБОТАТЬ:
-- DELETE FROM Department;
-- SELECT * FROM Discipline;

-- Тест для rl_administrator
-- ДОЛЖНО РАБОТАТЬ:
-- SET ROLE rl_administrator;
-- SELECT * FROM Department;
-- INSERT INTO Department (Name_Department) VALUES ('Новая кафедра');
-- UPDATE Employee SET Personal_File_N = '1111111111111' WHERE Employee_Login = 'emp1';

-- ========================================
-- 7. ПРИМЕРЫ ДАННЫХ ДЛЯ ПРОВЕРКИ
-- ========================================

-- Добавить тестовые данные в Department
INSERT INTO Department (Name_Department) VALUES 
('Кафедра ИВТ'),
('Кафедра ПО'),
('Кафедра МОП')
ON CONFLICT DO NOTHING;

-- Добавить тестовые должности
INSERT INTO Post (Name_Post) VALUES 
('Профессор'),
('Доцент'),
('Ассистент')
ON CONFLICT DO NOTHING;

-- Добавить тестовые территории
INSERT INTO Territory (Name_Territory) VALUES 
('Корпус А'),
('Корпус Б'),
('Корпус В')
ON CONFLICT DO NOTHING;

-- Добавить тестовые аудитории
INSERT INTO Audience (Number_Audience) VALUES 
('101'),
('102'),
('103'),
('201'),
('202')
ON CONFLICT DO NOTHING;

-- Проверить добавленные данные
SELECT * FROM Department;
SELECT * FROM Post;
SELECT * FROM Territory;
SELECT * FROM Audience;

-- ========================================
-- 8. ПРОВЕРКА ЦЕЛОСТНОСТИ ДАННЫХ
-- ========================================

-- Проверить наличие внешних ключей без соответствующих записей
-- (для каждой таблицы с внешними ключами)

-- Проверить Study_Grpoup без WrkCrr
SELECT sg.* FROM Study_Grpoup sg
LEFT JOIN WrkCrr wc ON sg.WrkCrr_ID = wc.ID_WrkCrr
WHERE wc.ID_WrkCrr IS NULL;

-- Проверить Bussines_Role без Department
SELECT br.* FROM Bussines_Role br
LEFT JOIN Department d ON br.Department_ID = d.ID_Department
WHERE d.ID_Department IS NULL;

-- ========================================
-- 9. РАЗМЕР ТАБЛИЦ
-- ========================================

-- Размер каждой таблицы
SELECT
    schemaname,
    tablename,
    pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) as size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC;

-- ========================================
-- 10. ПОСЛЕДОВАТЕЛЬНОСТИ (SEQUENCES)
-- ========================================

-- Все созданные последовательности
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

-- Текущее значение для каждой последовательности
SELECT 
    sequence_name,
    last_value
FROM information_schema.sequences
WHERE sequence_schema = 'public'
ORDER BY sequence_name;
