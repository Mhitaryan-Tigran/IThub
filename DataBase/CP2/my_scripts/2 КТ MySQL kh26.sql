-- MySQL: Строительная организация
-- Студент: Тингран, группа: kh26

-- Создание базы данных
CREATE DATABASE construction_kh26;
USE construction_kh26;

-- Создание пользователей (локальное подключение)
CREATE USER rl_administrator@'127.0.0.1' IDENTIFIED BY 'Pa$$w0rd';
GRANT ALL ON construction_kh26.* TO rl_administrator@'127.0.0.1';

CREATE USER rl_manager@'127.0.0.1' IDENTIFIED BY 'Pa$$w0rd';
GRANT ALL ON construction_kh26.* TO rl_manager@'127.0.0.1';

CREATE USER rl_foreman@'127.0.0.1' IDENTIFIED BY 'Pa$$w0rd';
GRANT ALL ON construction_kh26.* TO rl_foreman@'127.0.0.1';

CREATE USER rl_worker@'127.0.0.1' IDENTIFIED BY 'Pa$$w0rd';
GRANT ALL ON construction_kh26.* TO rl_worker@'127.0.0.1';

CREATE USER rl_customer@'127.0.0.1' IDENTIFIED BY 'Pa$$w0rd';
GRANT ALL ON construction_kh26.* TO rl_customer@'127.0.0.1';

-- Проверка созданных пользователей
SELECT user, host FROM mysql.user 
WHERE user IN ('rl_administrator', 'rl_manager', 'rl_foreman', 'rl_worker', 'rl_customer');
