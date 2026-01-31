CREATE OR REPLACE PROCEDURE Structure_Create ()
LANGUAGE plpgsql
AS $$
BEGIN 

    CREATE TABLE IF NOT EXISTS Department
    (
        ID_Department SERIAL NOT NULL CONSTRAINT PK_Department PRIMARY KEY,
        Name_Department VARCHAR(100) NOT NULL 
    );
    
    CREATE INDEX IF NOT EXISTS index_ID_Department ON Department (ID_Department);
    CREATE INDEX IF NOT EXISTS index_Name_Department ON Department (Name_Department);

    CREATE TABLE IF NOT EXISTS Post
    (
        ID_Post SERIAL NOT NULL CONSTRAINT PK_Post PRIMARY KEY,
        Name_Post VARCHAR(50) NOT NULL
    );
    
    CREATE INDEX IF NOT EXISTS index_ID_Post ON Post (ID_Post);
    CREATE INDEX IF NOT EXISTS index_Name_Post ON Post (Name_Post);

    CREATE TABLE IF NOT EXISTS Discipline
    (
        ID_Discipline SERIAL NOT NULL CONSTRAINT PK_Discipline PRIMARY KEY,
        Prefix_Discipline VARCHAR(10) NOT NULL, 
        Name_Discipline VARCHAR(100) NOT NULL
    );
    
    CREATE INDEX IF NOT EXISTS index_ID_Discipline ON Discipline (ID_Discipline);
    CREATE INDEX IF NOT EXISTS index_Prefix_Name_Discipline ON Discipline (Prefix_Discipline, Name_Discipline);

    CREATE TABLE IF NOT EXISTS User_Profile
    (
        UP_Login VARCHAR(36) NOT NULL CONSTRAINT PK_User_Profile PRIMARY KEY,
        UP_Password VARCHAR(36) NOT NULL,
        U_Surname VARCHAR(50) NOT NULL,
        U_Name VARCHAR(50) NOT NULL,
        U_Patronymic VARCHAR(50) NULL
    );
    
    CREATE INDEX IF NOT EXISTS index_UP_Login_Password ON User_Profile (UP_Login, UP_Password);
    CREATE INDEX IF NOT EXISTS index_U_Surname_Name_Patronymic ON User_Profile (U_Surname, U_Name, U_Patronymic);

    CREATE TABLE IF NOT EXISTS Territory
    (
        ID_Territory SERIAL NOT NULL CONSTRAINT PK_Territory PRIMARY KEY,
        Name_Territory VARCHAR(50) NOT NULL
    );
    
    CREATE INDEX IF NOT EXISTS index_ID_Territory ON Territory (ID_Territory);
    CREATE INDEX IF NOT EXISTS index_Name_Territory ON Territory (Name_Territory);

    CREATE TABLE IF NOT EXISTS Audience
    (
        ID_Audience SERIAL NOT NULL CONSTRAINT PK_Audience PRIMARY KEY,
        Number_Audience VARCHAR(7) NOT NULL
    );
    
    CREATE INDEX IF NOT EXISTS index_ID_Audience ON Audience (ID_Audience);
    CREATE INDEX IF NOT EXISTS index_Number_Audience ON Audience (Number_Audience);

    CREATE TABLE IF NOT EXISTS Bussines_Role
    (
        ID_Bussines_Role SERIAL NOT NULL CONSTRAINT PK_Bussines_Role PRIMARY KEY,
        Name_BR VARCHAR(50) NOT NULL,
        Department_ID INT NOT NULL REFERENCES Department (ID_Department)
    );
    
    CREATE INDEX IF NOT EXISTS index_ID_Bussines_Role ON Bussines_Role (ID_Bussines_Role);
    CREATE INDEX IF NOT EXISTS index_Name_BR ON Bussines_Role (Name_BR);

    CREATE TABLE IF NOT EXISTS WrkCrr
    (
        ID_WrkCrr SERIAL NOT NULL CONSTRAINT PK_WrkCrr PRIMARY KEY,
        N_Week_WrkCrr INT NOT NULL,
        N_Hours_WrkCrr DECIMAL(5,2) NOT NULL,
        Bussines_Role_ID INT NOT NULL REFERENCES Bussines_Role (ID_Bussines_Role)
    );
    
    CREATE INDEX IF NOT EXISTS index_ID_WrkCrr ON WrkCrr (ID_WrkCrr);

    CREATE TABLE IF NOT EXISTS Study_Grpoup
    (
        ID_Study_Grpoup SERIAL NOT NULL CONSTRAINT PK_Study_Grpoup PRIMARY KEY,
        Name_St_Grp VARCHAR(10) NOT NULL,
        Date_Create_SG DATE NOT NULL,
        WrkCrr_ID INT NOT NULL REFERENCES WrkCrr (ID_WrkCrr)
    );
    
    CREATE INDEX IF NOT EXISTS index_ID_Study_Grpoup ON Study_Grpoup (ID_Study_Grpoup);
    CREATE INDEX IF NOT EXISTS index_Name_St_Grp ON Study_Grpoup (Name_St_Grp);
    CREATE INDEX IF NOT EXISTS index_Date_Create_SG ON Study_Grpoup (Date_Create_SG);

    CREATE TABLE IF NOT EXISTS Student
    (
        Login_Student VARCHAR(36) NOT NULL CONSTRAINT PK_Student PRIMARY KEY 
            REFERENCES User_Profile (UP_Login) ON UPDATE CASCADE ON DELETE CASCADE,
        Credit_Card_N VARCHAR(13) NOT NULL
    );
    
    CREATE INDEX IF NOT EXISTS index_Login_Student ON Student (Login_Student);
    CREATE INDEX IF NOT EXISTS index_Credit_Card_N ON Student (Credit_Card_N);

    CREATE TABLE IF NOT EXISTS Employee
    (
        Employee_Login VARCHAR(36) NOT NULL CONSTRAINT PK_Employee PRIMARY KEY
            REFERENCES User_Profile (UP_Login) ON UPDATE CASCADE ON DELETE CASCADE,
        Personal_File_N VARCHAR(13) NOT NULL
    );
    
    CREATE INDEX IF NOT EXISTS index_Employee_Login ON Employee (Employee_Login);
    CREATE INDEX IF NOT EXISTS index_Personal_File_N ON Employee (Personal_File_N);

    CREATE TABLE IF NOT EXISTS Dep_Discipl
    (
        ID_Dep_Discipl SERIAL NOT NULL CONSTRAINT PK_Dep_Discipl PRIMARY KEY,
        Course_N INT NOT NULL,
        Semester_N INT NOT NULL,
        N_H_Dep_Discipl INT NOT NULL,
        WrkCrr_ID INT NOT NULL REFERENCES WrkCrr (ID_WrkCrr),
        Discipline_ID INT NOT NULL REFERENCES Discipline (ID_Discipline)
    );
    
    CREATE INDEX IF NOT EXISTS index_ID_Dep_Discipl ON Dep_Discipl(ID_Dep_Discipl);
    CREATE INDEX IF NOT EXISTS index_Course_N ON Dep_Discipl (Course_N);
    CREATE INDEX IF NOT EXISTS index_Semester_N ON Dep_Discipl (Semester_N);

    CREATE TABLE IF NOT EXISTS Distrib_Grps
    (
        ID_Distrib_Grps SERIAL NOT NULL CONSTRAINT PK_Distrib_Grps PRIMARY KEY,
        Study_Grpoup_ID INT NOT NULL REFERENCES Study_Grpoup (ID_Study_Grpoup),
        Student_Login VARCHAR(36) NOT NULL REFERENCES Student (Login_Student) ON UPDATE CASCADE ON DELETE CASCADE
    );
    
    CREATE INDEX IF NOT EXISTS index_ID_Distrib_Grps ON Distrib_Grps (ID_Distrib_Grps);

    CREATE TABLE IF NOT EXISTS Audiens_Territ
    (
        ID_Audiens_Territ SERIAL NOT NULL CONSTRAINT PK_Audiens_Territ PRIMARY KEY,
        Territory_ID INT NOT NULL REFERENCES Territory (ID_Territory),
        Audience_ID INT NOT NULL REFERENCES Audience (ID_Audience)
    );
    
    CREATE INDEX IF NOT EXISTS index_ID_Audiens_Territ ON Audiens_Territ (ID_Audiens_Territ);

    CREATE TABLE IF NOT EXISTS Combination
    (
        ID_Combination SERIAL NOT NULL CONSTRAINT PK_Combination PRIMARY KEY,
        Department_ID INT NOT NULL REFERENCES Department (ID_Department),
        Post_ID INT NOT NULL REFERENCES Post (ID_Post),
        Login_Employee VARCHAR(36) NOT NULL REFERENCES Employee (Employee_Login) ON UPDATE CASCADE ON DELETE CASCADE
    );
    
    CREATE INDEX IF NOT EXISTS index_ID_Combination ON Combination (ID_Combination);

    CREATE TABLE IF NOT EXISTS Workload
    (
        ID_Workload SERIAL NOT NULL CONSTRAINT PK_Workload PRIMARY KEY,
        N_Hr_Workload DECIMAL(5,1) NOT NULL,
        Study_Grpoup_ID INT REFERENCES Study_Grpoup (ID_Study_Grpoup),
        Dep_Discipl_ID INT REFERENCES Dep_Discipl (ID_Dep_Discipl),
        Combination_ID INT REFERENCES Combination (ID_Combination)
    );
    
    CREATE INDEX IF NOT EXISTS index_ID_Workload ON Workload (ID_Workload);

    CREATE TABLE IF NOT EXISTS Schedule
    (
        ID_Schedule SERIAL NOT NULL CONSTRAINT PK_Schedule PRIMARY KEY,
        D_W_Schedule VARCHAR(11) NOT NULL,
        Pair_N_Schedule INT NOT NULL,
        N_S_H_Schedule INT NOT NULL,
        Workload_ID INT NOT NULL REFERENCES Workload (ID_Workload),
        Audiens_Territ_ID INT NOT NULL REFERENCES Audiens_Territ (ID_Audiens_Territ)
    );
    
    CREATE INDEX IF NOT EXISTS index_ID_Schedule ON Schedule (ID_Schedule);
    CREATE INDEX IF NOT EXISTS index_D_W_Schedule ON Schedule (D_W_Schedule);
    CREATE INDEX IF NOT EXISTS index_Pair_N_Schedule ON Schedule (Pair_N_Schedule);

    CREATE ROLE rl_architect NOLOGIN;
    CREATE ROLE rl_teacher NOLOGIN;
    CREATE ROLE rl_student NOLOGIN;
    CREATE ROLE rl_managersd NOLOGIN;
    CREATE ROLE rl_administrator NOLOGIN;

    GRANT SELECT, INSERT, UPDATE ON Department TO rl_architect;
    GRANT USAGE, SELECT ON SEQUENCE department_id_department_seq TO rl_architect;
    
    GRANT SELECT, INSERT, UPDATE ON Bussines_Role TO rl_architect;
    GRANT USAGE, SELECT ON SEQUENCE bussines_role_id_bussines_role_seq TO rl_architect;
    
    GRANT SELECT ON Post TO rl_architect;
    GRANT SELECT ON Study_Grpoup TO rl_architect;
    GRANT SELECT ON Student TO rl_architect;
    GRANT SELECT ON Distrib_Grps TO rl_architect;
    GRANT SELECT ON Audiens_Territ TO rl_architect;
    GRANT SELECT ON Combination TO rl_architect;
    GRANT SELECT ON Schedule TO rl_architect;
    
    GRANT SELECT, INSERT, UPDATE, DELETE ON Discipline TO rl_architect;
    GRANT USAGE, SELECT ON SEQUENCE discipline_id_discipline_seq TO rl_architect;
    
    GRANT SELECT, INSERT, UPDATE, DELETE ON WrkCrr TO rl_architect;
    GRANT USAGE, SELECT ON SEQUENCE wrkcrr_id_wrkcrr_seq TO rl_architect;
    
    GRANT SELECT, INSERT, UPDATE, DELETE ON Dep_Discipl TO rl_architect;
    GRANT USAGE, SELECT ON SEQUENCE dep_discipl_id_dep_discipl_seq TO rl_architect;
    
    GRANT SELECT, INSERT, UPDATE, DELETE ON Workload TO rl_architect;
    GRANT USAGE, SELECT ON SEQUENCE workload_id_workload_seq TO rl_architect;
    
    GRANT SELECT, UPDATE ON User_Profile TO rl_architect;

    GRANT SELECT, UPDATE ON User_Profile TO rl_teacher;
    GRANT SELECT ON Student TO rl_teacher;
    GRANT SELECT ON Schedule TO rl_teacher;

    GRANT SELECT, UPDATE ON User_Profile TO rl_student;
    GRANT SELECT, UPDATE ON Student TO rl_student;
    GRANT SELECT ON Schedule TO rl_student;

    GRANT SELECT, UPDATE ON User_Profile TO rl_managersd;
    
    GRANT SELECT, INSERT, UPDATE, DELETE ON Study_Grpoup TO rl_managersd;
    GRANT USAGE, SELECT ON SEQUENCE study_grpoup_id_study_grpoup_seq TO rl_managersd;
    
    GRANT SELECT, INSERT, UPDATE, DELETE ON Student TO rl_managersd;
    
    GRANT SELECT, INSERT, UPDATE, DELETE ON Distrib_Grps TO rl_managersd;
    GRANT USAGE, SELECT ON SEQUENCE distrib_grps_id_distrib_grps_seq TO rl_managersd;
    
    GRANT SELECT, INSERT, UPDATE, DELETE ON Schedule TO rl_managersd;
    GRANT USAGE, SELECT ON SEQUENCE schedule_id_schedule_seq TO rl_managersd;

    GRANT SELECT, INSERT, UPDATE, DELETE ON Department TO rl_administrator;
    GRANT USAGE, SELECT ON SEQUENCE department_id_department_seq TO rl_administrator;
    
    GRANT SELECT, INSERT, UPDATE, DELETE ON Post TO rl_administrator;
    GRANT USAGE, SELECT ON SEQUENCE post_id_post_seq TO rl_administrator;
    
    GRANT SELECT, INSERT, UPDATE, DELETE ON Territory TO rl_administrator;
    GRANT USAGE, SELECT ON SEQUENCE territory_id_territory_seq TO rl_administrator;
    
    GRANT SELECT, INSERT, UPDATE, DELETE ON Audience TO rl_administrator;
    GRANT USAGE, SELECT ON SEQUENCE audience_id_audience_seq TO rl_administrator;
    
    GRANT SELECT, INSERT, UPDATE, DELETE ON Bussines_Role TO rl_administrator;
    GRANT USAGE, SELECT ON SEQUENCE bussines_role_id_bussines_role_seq TO rl_administrator;
    
    GRANT SELECT, INSERT, UPDATE, DELETE ON Student TO rl_administrator;
    GRANT SELECT, INSERT, UPDATE, DELETE ON Employee TO rl_administrator;
    
    GRANT SELECT, INSERT, UPDATE, DELETE ON Audiens_Territ TO rl_administrator;
    GRANT USAGE, SELECT ON SEQUENCE audiens_territ_id_audiens_territ_seq TO rl_administrator;
    
    GRANT SELECT, INSERT, UPDATE, DELETE ON Combination TO rl_administrator;
    GRANT USAGE, SELECT ON SEQUENCE combination_id_combination_seq TO rl_administrator;
    
    GRANT SELECT, INSERT, UPDATE, DELETE ON Schedule TO rl_administrator;
    GRANT USAGE, SELECT ON SEQUENCE schedule_id_schedule_seq TO rl_administrator;
    
    GRANT SELECT, INSERT, DELETE ON User_Profile TO rl_administrator;

    RAISE NOTICE 'БД создана! Таблиц: 17, Индексов: 32, Ролей: 5';

END;
$$;
