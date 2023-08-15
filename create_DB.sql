/*  ------------ CREATE DATABASE  ------------  */
/*(make sure you are in the Master db system in the dropdown)*/
-- CREATE DATABASE C41BootCamp;

/* ------------ CREATE TABLE ------------ */
-- CREATE TABLE Students (
--     Id INT PRIMARY KEY IDENTITY(1, 1),
--     Firstname VARCHAR(30) NOT NULL,
--     Lastname VARCHAR(30) NOT NULL,
--     Phone VARCHAR(12) NULL,
--     Address VARCHAR(75) NULL,
--     City VARCHAR(30) NULL,
--     State CHAR(2) NOT NULL DEFAULT 'OH',
--     Zipcode VARCHAR(5) NULL
-- );

-- CREATE TABLE Technologies (
--     Id INT PRIMARY KEY IDENTITY(1, 1),
--     Name VARCHAR(30) NOT NULL, 
--     InstructionDays INT NOT NULL DEFAULT 5
-- );

-- CREATE TABLE Curriculum (
--     Id INT PRIMARY KEY IDENTITY(1, 1),
--     Day INT NOT NULL,
--     Topic VARCHAR(50) NOT NULL,
--     TecnhologiesId INT NOT NULL FOREIGN KEY REFERENCES Technologies(Id)
-- );

/* ------------ INSERT INTO TABLE ------------ */

-- insert Students (Firstname, lastname, phone, address, city, state, zipcode
-- )
-- values (
--     'Tony','Rawlins','7143882054','4220 n drade rd','Golden Valley','AZ','86413'
-- )

-- INSERT students (
--     Firstname, lastname, phone, address, city, state, zipcode)
-- VALUES ('Elon', 'Musk', '525-274-6544', '1234 Starklink St', 'Houston', 'TX', '86475'),
--     ('Mark', 'Zuckerberg', '808-657-6114', '456 Meta Rd', 'Kauai', 'HI', '91355'),
--     ('Susan', 'Jensen', '912-687-3547', '21 Garden City Blvd', 'Fullerton', 'CA', '91567'),
--     ('Colonel', 'Sanders', '344-657-1973', '97 Chicken Cir', 'Louisville', 'KY', '86475'),
--     ('Crystal', 'Gonzales', '515-879-1111', '75th St', 'Bronx', 'NY', '37566'),
--     ('Jennifer', 'Connelly', '802-579-3497', '978 Piper St', 'Cairo', 'NY', '34968');

-- alter table students
--     add Active bit not null DEFAULT 1;

-- INSERT Technologies (
--     Name, InstructionDays
-- )
-- VALUES ('GIT', '1'),
--         ('SQL', '6'),
--         ('C#', '17'),
--         ('EF WebAPI', '7'),
--         ('Java', '4'),
--         ('Spring', '5'),
--         ('HTML/CSS', '3'),
--         ('Javascript', '3'),
--         ('Angular', '5');

-- INSERT Curriculum (
--     Day, Topic, TecnhologiesId
-- )
-- VALUES (1, 'Git/Github (GD)', 1),
--         (2, 'SQL Server (GD)', 2),
--         (7, 'C# (GD)', 3),
--         (24, 'EF/WebApi (GD)', 4),
--         (22, 'Java (GD)', 5),
--         (36, 'Spring (GD)', 6),
--         (41, 'HTML/CSS (GD)', 7),
--         (44, 'JavaScript (GD)', 8),
--         (52, 'Angular/TS (GD)', 9)


-- select *
-- from Curriculum c
-- join Technologies t 
-- on c.TecnhologiesId = t.Id;

-- select * from Students;