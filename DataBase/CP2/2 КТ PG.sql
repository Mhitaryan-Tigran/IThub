create role rl_architect with password 'Pa$$w0rd';
alter role rl_architect LOGIN;
grant connect on database "studding_process_db" to rl_architect;

create role rl_teacher with password 'Pa$$w0rd';
alter role rl_teacher LOGIN;
grant connect on database "studding_process_db" to rl_teacher;

create role rl_student with password 'Pa$$w0rd';
alter role rl_student LOGIN;
grant connect on database "studding_process_db" to rl_student;

create role rl_managersd with password 'Pa$$w0rd';
alter role rl_managersd LOGIN;
grant connect on database "studding_process_db" to rl_managersd;

create role rl_administrator with password 'Pa$$w0rd';
alter role rl_administrator LOGIN;
grant connect on database "studding_process_db" to rl_administrator;

select * from pg_roles where rolname in ('rl_architect', 'rl_teacher', 'rl_student', 'rl_managersd', 'rl_administrator');