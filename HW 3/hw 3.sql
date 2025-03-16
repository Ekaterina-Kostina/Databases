CREATE DATABASE IF NOT EXISTS headhunter_db;
USE headhunter_db;

CREATE TABLE Company (
    Company_ID INT PRIMARY KEY NOT NULL,
    Name VARCHAR(255),
    Description TEXT
);

CREATE TABLE Jobs (
    Job_ID INT NOT NULL,
    Company_ID INT,
    Salary DECIMAL(10,2),
    Requirements TEXT,
    PRIMARY KEY (Job_ID),
    FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID)
);

CREATE TABLE Applications (
    Application_ID INT NOT NULL,
    Job_ID INT,
    Candidate_ID INT,
    Resume_ID INT,
    Cover_Letter TEXT,
    PRIMARY KEY (Application_ID),
    FOREIGN KEY (Job_ID) REFERENCES Jobs(Job_ID)
);
INSERT INTO Company (Company_ID, Name, Description) VALUES
(1, 'Romashka', 'A leading tech company'),
(2, 'BestCompanyEver', 'The best company with the worst conditions');

INSERT INTO Jobs (Job_ID, Company_ID, Salary, Requirements) VALUES
(1, 1, 370000.00, '5 years of experience in software development'),
(2, 2, 50000.00, '2 years of experience in customer support');

INSERT INTO Applications (Application_ID, Job_ID, Candidate_ID, Resume_ID, Cover_Letter) VALUES
(1, 1, 101, 1001, 'I am excited to apply for this job!'),
(2, 2, 102, 1002, 'I am the best employee ever');
SELECT * FROM Company;
SELECT * FROM Jobs;
SELECT * FROM Applications;

ALTER TABLE Jobs ADD COLUMN Experience INT;
SELECT * FROM Jobs;

INSERT INTO Jobs VALUES (3, 1, 60000.00, '3 years of experience in IT support', 3);
SELECT * FROM Jobs;

UPDATE Jobs 
SET Experience = 5 
WHERE Job_ID = 1;

UPDATE Jobs 
SET Experience = 2 
WHERE Job_ID = 2;
SELECT * FROM Jobs;

ALTER TABLE Jobs DROP COLUMN Requirements;
SELECT * FROM Jobs;

SELECT Name, Description FROM Company WHERE company_id = 2;
SELECT * FROM Jobs WHERE Salary > 55000 AND Experience < 5;
SELECT Cover_Letter FROM Applications WHERE Job_ID = 1;