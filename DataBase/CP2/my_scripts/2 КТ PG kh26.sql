-- PostgreSQL: Строительная организация
-- Студент: Тингран, группа: kh26

-- Создание базы данных (выполнить под postgres)
CREATE DATABASE construction_kh26;

-- Создание ролей
CREATE ROLE rl_administrator WITH PASSWORD 'Pa$$w0rd';
ALTER ROLE rl_administrator LOGIN;
GRANT CONNECT ON DATABASE construction_kh26 TO rl_administrator;

CREATE ROLE rl_manager WITH PASSWORD 'Pa$$w0rd';
ALTER ROLE rl_manager LOGIN;
GRANT CONNECT ON DATABASE construction_kh26 TO rl_manager;

CREATE ROLE rl_foreman WITH PASSWORD 'Pa$$w0rd';
ALTER ROLE rl_foreman LOGIN;
GRANT CONNECT ON DATABASE construction_kh26 TO rl_foreman;

CREATE ROLE rl_worker WITH PASSWORD 'Pa$$w0rd';
ALTER ROLE rl_worker LOGIN;
GRANT CONNECT ON DATABASE construction_kh26 TO rl_worker;

CREATE ROLE rl_customer WITH PASSWORD 'Pa$$w0rd';
ALTER ROLE rl_customer LOGIN;
GRANT CONNECT ON DATABASE construction_kh26 TO rl_customer;

-- Проверка созданных ролей
SELECT rolname, rolcanlogin FROM pg_roles 
WHERE rolname IN ('rl_administrator', 'rl_manager', 'rl_foreman', 'rl_worker', 'rl_customer');
