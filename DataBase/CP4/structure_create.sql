DELIMITER $$

CREATE PROCEDURE Structure_Create()
BEGIN

    CREATE TABLE IF NOT EXISTS Department
    (
        ID_Department INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        Name_Department VARCHAR(100) NOT NULL
    );
    CREATE INDEX index_Name_Department ON Department (Name_Department);

    CREATE TABLE IF NOT EXISTS Post
    (
        ID_Post INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        Name_Post VARCHAR(50) NOT NULL
    );
    CREATE INDEX index_Name_Post ON Post (Name_Post);

    CREATE TABLE IF NOT EXISTS Discipline
    (
        ID_Discipline INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        Prefix_Discipline VARCHAR(10) NOT NULL,
        Name_Discipline VARCHAR(100) NOT NULL
    );
    CREATE INDEX index_Prefix_Name_Discipline ON Discipline (Prefix_Discipline, Name_Discipline);

    CREATE TABLE IF NOT EXISTS User_Profile
    (
        UP_Login VARCHAR(36) NOT NULL PRIMARY KEY,
        UP_Password VARCHAR(36) NOT NULL,
        U_Surname VARCHAR(50) NOT NULL,
        U_Name VARCHAR(50) NOT NULL,
        U_Patronymic VARCHAR(50) NULL
    );
    CREATE INDEX index_UP_Login_Password ON User_Profile (UP_Login, UP_Password);
    CREATE INDEX index_U_Surname_Name_Patronymic ON User_Profile (U_Surname, U_Name, U_Patronymic);

    CREATE TABLE IF NOT EXISTS Territory
    (
        ID_Territory INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        Name_Territory VARCHAR(50) NOT NULL
    );
    CREATE INDEX index_Name_Territory ON Territory (Name_Territory);

    CREATE TABLE IF NOT EXISTS Audience
    (
        ID_Audience INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        Number_Audience VARCHAR(7) NOT NULL
    );
    CREATE INDEX index_Number_Audience ON Audience (Number_Audience);

    CREATE TABLE IF NOT EXISTS Bussines_Role
    (
        ID_Bussines_Role INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        Name_BR VARCHAR(50) NOT NULL,
        Department_ID INT NOT NULL REFERENCES Department (ID_Department)
    );
    CREATE INDEX index_Name_BR ON Bussines_Role (Name_BR);

    CREATE TABLE IF NOT EXISTS WrkCrr
    (
        ID_WrkCrr INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        N_Week_WrkCrr INT NOT NULL,
        N_Hours_WrkCrr DECIMAL(5,2) NOT NULL,
        Bussines_Role_ID INT NOT NULL REFERENCES Bussines_Role (ID_Bussines_Role)
    );

    CREATE TABLE IF NOT EXISTS Study_Grpoup
    (
        ID_Study_Grpoup INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        Name_St_Grp VARCHAR(10) NOT NULL,
        Date_Create_SG DATE NOT NULL,
        WrkCrr_ID INT NOT NULL REFERENCES WrkCrr (ID_WrkCrr)
    );
    CREATE INDEX index_Name_St_Grp ON Study_Grpoup (Name_St_Grp);
    CREATE INDEX index_Date_Create_SG ON Study_Grpoup (Date_Create_SG);

    CREATE TABLE IF NOT EXISTS Student
    (
        Login_Student VARCHAR(36) NOT NULL PRIMARY KEY
            REFERENCES User_Profile (UP_Login),
        Credit_Card_N VARCHAR(13) NOT NULL
    );
    CREATE INDEX index_Credit_Card_N ON Student (Credit_Card_N);

    CREATE TABLE IF NOT EXISTS Employee
    (
        Employee_Login VARCHAR(36) NOT NULL PRIMARY KEY
            REFERENCES User_Profile (UP_Login),
        Personal_File_N VARCHAR(13) NOT NULL
    );
    CREATE INDEX index_Personal_File_N ON Employee (Personal_File_N);

    CREATE TABLE IF NOT EXISTS Dep_Discipl
    (
        ID_Dep_Discipl INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        Course_N INT NOT NULL,
        Semester_N INT NOT NULL,
        N_H_Dep_Discipl INT NOT NULL,
        WrkCrr_ID INT NOT NULL REFERENCES WrkCrr (ID_WrkCrr),
        Discipline_ID INT NOT NULL REFERENCES Discipline (ID_Discipline)
    );
    CREATE INDEX index_Course_N ON Dep_Discipl (Course_N);
    CREATE INDEX index_Semester_N ON Dep_Discipl (Semester_N);

    CREATE TABLE IF NOT EXISTS Distrib_Grps
    (
        ID_Distrib_Grps INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        Study_Grpoup_ID INT NOT NULL,
        Student_Login VARCHAR(36) NOT NULL REFERENCES Student (Login_Student)
    );

    CREATE TABLE IF NOT EXISTS Audiens_Territ
    (
        ID_Audiens_Territ INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        Territory_ID INT NOT NULL REFERENCES Territory (ID_Territory),
        Audience_ID INT NOT NULL REFERENCES Audience (ID_Audience)
    );

    CREATE TABLE IF NOT EXISTS Combination
    (
        ID_Combination INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        Department_ID INT NOT NULL REFERENCES Department (ID_Department),
        Post_ID INT NOT NULL REFERENCES Post (ID_Post),
        Login_Employee VARCHAR(36) NOT NULL REFERENCES Employee (Employee_Login)
    );

    CREATE TABLE IF NOT EXISTS Workload
    (
        ID_Workload INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        N_Hr_Workload DECIMAL(5,1) NOT NULL,
        Study_Grpoup_ID INT REFERENCES Study_Grpoup (ID_Study_Grpoup),
        Dep_Discipl_ID INT REFERENCES Dep_Discipl (ID_Dep_Discipl),
        Combination_ID INT REFERENCES Combination (ID_Combination)
    );

    CREATE TABLE IF NOT EXISTS Schedule
    (
        ID_Schedule INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        D_W_Schedule VARCHAR(11) NOT NULL,
        Pair_N_Schedule INT NOT NULL,
        N_S_H_Schedule INT NOT NULL,
        Workload_ID INT NOT NULL REFERENCES Workload (ID_Workload),
        Audiens_Territ_ID INT NOT NULL REFERENCES Audiens_Territ (ID_Audiens_Territ)
    );
    CREATE INDEX index_D_W_Schedule ON Schedule (D_W_Schedule);
    CREATE INDEX index_Pair_N_Schedule ON Schedule (Pair_N_Schedule);

    CREATE USER IF NOT EXISTS 'rl_architect'@'127.0.0.1';
    CREATE USER IF NOT EXISTS 'rl_teacher'@'127.0.0.1';
    CREATE USER IF NOT EXISTS 'rl_student'@'127.0.0.1';
    CREATE USER IF NOT EXISTS 'rl_managersd'@'127.0.0.1';
    CREATE USER IF NOT EXISTS 'rl_administrator'@'127.0.0.1';

    GRANT SELECT, INSERT, UPDATE ON Department TO rl_architect@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE ON Bussines_Role TO rl_architect@'127.0.0.1';
    GRANT SELECT ON Post TO rl_architect@'127.0.0.1';
    GRANT SELECT ON Study_Grpoup TO rl_architect@'127.0.0.1';
    GRANT SELECT ON Student TO rl_architect@'127.0.0.1';
    GRANT SELECT ON Distrib_Grps TO rl_architect@'127.0.0.1';
    GRANT SELECT ON Audiens_Territ TO rl_architect@'127.0.0.1';
    GRANT SELECT ON Combination TO rl_architect@'127.0.0.1';
    GRANT SELECT ON Schedule TO rl_architect@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON Discipline TO rl_architect@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON WrkCrr TO rl_architect@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON Dep_Discipl TO rl_architect@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON Workload TO rl_architect@'127.0.0.1';
    GRANT SELECT, UPDATE ON User_Profile TO rl_architect@'127.0.0.1';

    GRANT SELECT, UPDATE ON User_Profile TO rl_teacher@'127.0.0.1';
    GRANT SELECT ON Student TO rl_teacher@'127.0.0.1';
    GRANT SELECT ON Schedule TO rl_teacher@'127.0.0.1';

    GRANT SELECT, UPDATE ON User_Profile TO rl_student@'127.0.0.1';
    GRANT SELECT, UPDATE ON Student TO rl_student@'127.0.0.1';
    GRANT SELECT ON Schedule TO rl_student@'127.0.0.1';

    GRANT SELECT, UPDATE ON User_Profile TO rl_managersd@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON Study_Grpoup TO rl_managersd@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON Student TO rl_managersd@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON Distrib_Grps TO rl_managersd@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON Schedule TO rl_managersd@'127.0.0.1';

    GRANT SELECT, INSERT, UPDATE, DELETE ON Department TO rl_administrator@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON Post TO rl_administrator@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON Territory TO rl_administrator@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON Audience TO rl_administrator@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON Bussines_Role TO rl_administrator@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON Student TO rl_administrator@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON Employee TO rl_administrator@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON Audiens_Territ TO rl_administrator@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON Combination TO rl_administrator@'127.0.0.1';
    GRANT SELECT, INSERT, UPDATE, DELETE ON Schedule TO rl_administrator@'127.0.0.1';
    GRANT SELECT, INSERT, DELETE ON User_Profile TO rl_administrator@'127.0.0.1';

END $$

DELIMITER ;
