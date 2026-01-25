create database Studding_Process_DB;
use Studding_Process_DB;

create user rl_architect@'127.0.0.1' identified by 'Pa$$w0rd';
grant all on studding_process_db to rl_architect@'127.0.0.1';

create user rl_teacher@'127.0.0.1' identified by 'Pa$$w0rd';
grant all on studding_process_db to rl_teacher@'127.0.0.1';

create user rl_student@'127.0.0.1' identified by 'Pa$$w0rd';
grant all on studding_process_db to rl_student@'127.0.0.1';

create user rl_managersd@'127.0.0.1' identified by 'Pa$$w0rd';
grant all on studding_process_db to rl_managersd@'127.0.0.1';

create user rl_administrator@'127.0.0.1' identified by 'Pa$$w0rd';
grant all on studding_process_db to rl_administrator@'127.0.0.1';

select * from mysql.user where user in ('rl_architect','rl_teacher','rl_student','rl_managersd','rl_administrator');