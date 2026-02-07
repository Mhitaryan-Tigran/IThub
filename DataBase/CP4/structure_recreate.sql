DELIMITER $$

CREATE PROCEDURE Structure_Re_Create()
BEGIN

    REVOKE SELECT, INSERT, UPDATE ON Department FROM rl_architect@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE ON Bussines_Role FROM rl_architect@'127.0.0.1';
    REVOKE SELECT ON Post FROM rl_architect@'127.0.0.1';
    REVOKE SELECT ON Study_Grpoup FROM rl_architect@'127.0.0.1';
    REVOKE SELECT ON Student FROM rl_architect@'127.0.0.1';
    REVOKE SELECT ON Distrib_Grps FROM rl_architect@'127.0.0.1';
    REVOKE SELECT ON Audiens_Territ FROM rl_architect@'127.0.0.1';
    REVOKE SELECT ON Combination FROM rl_architect@'127.0.0.1';
    REVOKE SELECT ON Schedule FROM rl_architect@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Discipline FROM rl_architect@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON WrkCrr FROM rl_architect@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Dep_Discipl FROM rl_architect@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Workload FROM rl_architect@'127.0.0.1';
    REVOKE SELECT, UPDATE ON User_Profile FROM rl_architect@'127.0.0.1';

    REVOKE SELECT, UPDATE ON User_Profile FROM rl_teacher@'127.0.0.1';
    REVOKE SELECT ON Student FROM rl_teacher@'127.0.0.1';
    REVOKE SELECT ON Schedule FROM rl_teacher@'127.0.0.1';

    REVOKE SELECT, UPDATE ON User_Profile FROM rl_student@'127.0.0.1';
    REVOKE SELECT, UPDATE ON Student FROM rl_student@'127.0.0.1';
    REVOKE SELECT ON Schedule FROM rl_student@'127.0.0.1';

    REVOKE SELECT, UPDATE ON User_Profile FROM rl_managersd@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Study_Grpoup FROM rl_managersd@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Student FROM rl_managersd@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Distrib_Grps FROM rl_managersd@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Schedule FROM rl_managersd@'127.0.0.1';

    REVOKE SELECT, INSERT, UPDATE, DELETE ON Department FROM rl_administrator@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Post FROM rl_administrator@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Territory FROM rl_administrator@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Audience FROM rl_administrator@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Bussines_Role FROM rl_administrator@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Student FROM rl_administrator@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Employee FROM rl_administrator@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Audiens_Territ FROM rl_administrator@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Combination FROM rl_administrator@'127.0.0.1';
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Schedule FROM rl_administrator@'127.0.0.1';
    REVOKE SELECT, INSERT, DELETE ON User_Profile FROM rl_administrator@'127.0.0.1';

    DROP INDEX index_Pair_N_Schedule ON Schedule;
    DROP INDEX index_D_W_Schedule ON Schedule;
    DROP INDEX index_Semester_N ON Dep_Discipl;
    DROP INDEX index_Course_N ON Dep_Discipl;
    DROP INDEX index_Personal_File_N ON Employee;
    DROP INDEX index_Credit_Card_N ON Student;
    DROP INDEX index_Name_St_Grp ON Study_Grpoup;
    DROP INDEX index_Date_Create_SG ON Study_Grpoup;
    DROP INDEX index_Name_BR ON Bussines_Role;
    DROP INDEX index_Number_Audience ON Audience;
    DROP INDEX index_Name_Territory ON Territory;
    DROP INDEX index_U_Surname_Name_Patronymic ON User_Profile;
    DROP INDEX index_UP_Login_Password ON User_Profile;
    DROP INDEX index_Prefix_Name_Discipline ON Discipline;
    DROP INDEX index_Name_Post ON Post;
    DROP INDEX index_Name_Department ON Department;

    DROP TABLE IF EXISTS Schedule;
    DROP TABLE IF EXISTS Workload;
    DROP TABLE IF EXISTS Combination;
    DROP TABLE IF EXISTS Audiens_Territ;
    DROP TABLE IF EXISTS Distrib_Grps;
    DROP TABLE IF EXISTS Dep_Discipl;
    DROP TABLE IF EXISTS Employee;
    DROP TABLE IF EXISTS Student;
    DROP TABLE IF EXISTS Study_Grpoup;
    DROP TABLE IF EXISTS WrkCrr;
    DROP TABLE IF EXISTS Bussines_Role;
    DROP TABLE IF EXISTS Audience;
    DROP TABLE IF EXISTS Territory;
    DROP TABLE IF EXISTS User_Profile;
    DROP TABLE IF EXISTS Discipline;
    DROP TABLE IF EXISTS Post;
    DROP TABLE IF EXISTS Department;

    DROP USER IF EXISTS 'rl_architect'@'127.0.0.1';
    DROP USER IF EXISTS 'rl_teacher'@'127.0.0.1';
    DROP USER IF EXISTS 'rl_student'@'127.0.0.1';
    DROP USER IF EXISTS 'rl_managersd'@'127.0.0.1';
    DROP USER IF EXISTS 'rl_administrator'@'127.0.0.1';

    CALL Structure_Create();

END $$

DELIMITER ;
