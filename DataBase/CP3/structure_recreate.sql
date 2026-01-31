CREATE OR REPLACE PROCEDURE Structure_Re_Create ()
LANGUAGE plpgsql
AS $$
BEGIN
    REVOKE USAGE, SELECT ON SEQUENCE department_id_department_seq FROM rl_architect;
    REVOKE USAGE, SELECT ON SEQUENCE bussines_role_id_bussines_role_seq FROM rl_architect;
    REVOKE USAGE, SELECT ON SEQUENCE discipline_id_discipline_seq FROM rl_architect;
    REVOKE USAGE, SELECT ON SEQUENCE wrkcrr_id_wrkcrr_seq FROM rl_architect;
    REVOKE USAGE, SELECT ON SEQUENCE dep_discipl_id_dep_discipl_seq FROM rl_architect;
    REVOKE USAGE, SELECT ON SEQUENCE workload_id_workload_seq FROM rl_architect;
    
    REVOKE USAGE, SELECT ON SEQUENCE study_grpoup_id_study_grpoup_seq FROM rl_managersd;
    REVOKE USAGE, SELECT ON SEQUENCE distrib_grps_id_distrib_grps_seq FROM rl_managersd;
    REVOKE USAGE, SELECT ON SEQUENCE schedule_id_schedule_seq FROM rl_managersd;
    REVOKE USAGE, SELECT ON SEQUENCE department_id_department_seq FROM rl_administrator;
    REVOKE USAGE, SELECT ON SEQUENCE post_id_post_seq FROM rl_administrator;
    REVOKE USAGE, SELECT ON SEQUENCE territory_id_territory_seq FROM rl_administrator;
    REVOKE USAGE, SELECT ON SEQUENCE audience_id_audience_seq FROM rl_administrator;
    REVOKE USAGE, SELECT ON SEQUENCE bussines_role_id_bussines_role_seq FROM rl_administrator;
    REVOKE USAGE, SELECT ON SEQUENCE audiens_territ_id_audiens_territ_seq FROM rl_administrator;
    REVOKE USAGE, SELECT ON SEQUENCE combination_id_combination_seq FROM rl_administrator;
    REVOKE USAGE, SELECT ON SEQUENCE schedule_id_schedule_seq FROM rl_administrator;
    
    REVOKE SELECT, INSERT, UPDATE ON Department FROM rl_architect;
    REVOKE SELECT, INSERT, UPDATE ON Bussines_Role FROM rl_architect;
    REVOKE SELECT ON Post FROM rl_architect;
    REVOKE SELECT ON Study_Grpoup FROM rl_architect;
    REVOKE SELECT ON Student FROM rl_architect;
    REVOKE SELECT ON Distrib_Grps FROM rl_architect;
    REVOKE SELECT ON Audiens_Territ FROM rl_architect;
    REVOKE SELECT ON Combination FROM rl_architect;
    REVOKE SELECT ON Schedule FROM rl_architect;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Discipline FROM rl_architect;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON WrkCrr FROM rl_architect;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Dep_Discipl FROM rl_architect;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Workload FROM rl_architect;
    REVOKE SELECT, UPDATE ON User_Profile FROM rl_architect;
    
    REVOKE SELECT, UPDATE ON User_Profile FROM rl_teacher;
    REVOKE SELECT ON Student FROM rl_teacher;
    REVOKE SELECT ON Schedule FROM rl_teacher;
    
    REVOKE SELECT, UPDATE ON User_Profile FROM rl_student;
    REVOKE SELECT, UPDATE ON Student FROM rl_student;
    REVOKE SELECT ON Schedule FROM rl_student;
    
    REVOKE SELECT, UPDATE ON User_Profile FROM rl_managersd;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Study_Grpoup FROM rl_managersd;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Student FROM rl_managersd;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Distrib_Grps FROM rl_managersd;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Schedule FROM rl_managersd;
    
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Department FROM rl_administrator;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Post FROM rl_administrator;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Territory FROM rl_administrator;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Audience FROM rl_administrator;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Bussines_Role FROM rl_administrator;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Student FROM rl_administrator;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Employee FROM rl_administrator;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Audiens_Territ FROM rl_administrator;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Combination FROM rl_administrator;
    REVOKE SELECT, INSERT, UPDATE, DELETE ON Schedule FROM rl_administrator;
    REVOKE SELECT, INSERT, DELETE ON User_Profile FROM rl_administrator;
    
    DROP INDEX IF EXISTS index_Pair_N_Schedule;
    DROP INDEX IF EXISTS index_D_W_Schedule;
    DROP INDEX IF EXISTS index_ID_Schedule;
    
    DROP INDEX IF EXISTS index_ID_Workload;
    
    DROP INDEX IF EXISTS index_ID_Combination;
    
    DROP INDEX IF EXISTS index_ID_Audiens_Territ;
    
    DROP INDEX IF EXISTS index_ID_Distrib_Grps;
    
    DROP INDEX IF EXISTS index_Semester_N;
    DROP INDEX IF EXISTS index_Course_N;
    DROP INDEX IF EXISTS index_ID_Dep_Discipl;
    
    DROP INDEX IF EXISTS index_Personal_File_N;
    DROP INDEX IF EXISTS index_Employee_Login;
    
    DROP INDEX IF EXISTS index_Credit_Card_N;
    DROP INDEX IF EXISTS index_Login_Student;
    
    DROP INDEX IF EXISTS index_Date_Create_SG;
    DROP INDEX IF EXISTS index_Name_St_Grp;
    DROP INDEX IF EXISTS index_ID_Study_Grpoup;
    
    DROP INDEX IF EXISTS index_ID_WrkCrr;
    
    DROP INDEX IF EXISTS index_Name_BR;
    DROP INDEX IF EXISTS index_ID_Bussines_Role;
    
    DROP INDEX IF EXISTS index_Number_Audience;
    DROP INDEX IF EXISTS index_ID_Audience;
    
    DROP INDEX IF EXISTS index_Name_Territory;
    DROP INDEX IF EXISTS index_ID_Territory;
    
    DROP INDEX IF EXISTS index_U_Surname_Name_Patronymic;
    DROP INDEX IF EXISTS index_UP_Login_Password;
    
    DROP INDEX IF EXISTS index_Prefix_Name_Discipline;
    DROP INDEX IF EXISTS index_ID_Discipline;
    
    DROP INDEX IF EXISTS index_Name_Post;
    DROP INDEX IF EXISTS index_ID_Post;
    
    DROP INDEX IF EXISTS index_Name_Department;
    DROP INDEX IF EXISTS index_ID_Department;
    
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
    
    CALL Structure_Create();
    
END;
$$;
