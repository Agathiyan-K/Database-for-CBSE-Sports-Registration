create database registration;
use registration;
-- Create Table for School
CREATE TABLE School (
    school_id INT PRIMARY KEY AUTO_INCREMENT,
    school_name VARCHAR(255) NOT NULL,
    postal_address VARCHAR(255),
    telephone_numbers VARCHAR(50),
    principal_name VARCHAR(100),
    principal_signature TEXT
);

-- Create Table for ObserverReport
CREATE TABLE ObserverReport (
    observer_report_id INT PRIMARY KEY AUTO_INCREMENT,
    observer_name VARCHAR(255),
    postal_address VARCHAR(255),
    telephone_number VARCHAR(50),
    administrative_rating VARCHAR(50),
    technical_rating VARCHAR(50),
    overall_standard VARCHAR(50),
    suggestions TEXT
);

-- Create Table for Event
CREATE TABLE Event (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(255) NOT NULL,
    level VARCHAR(50),
    start_date DATE,
    end_date DATE,
    organizing_school_id INT,
    observer_report_id INT,
    FOREIGN KEY (organizing_school_id) REFERENCES School(school_id),
    FOREIGN KEY (observer_report_id) REFERENCES ObserverReport(observer_report_id)
);

-- Create Table for Student
CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(255) NOT NULL,
    class VARCHAR(50),
    admission_no VARCHAR(50),
    dob DATE,
    cbse_registration_no VARCHAR(50),
    photo TEXT,
    school_id INT,
    FOREIGN KEY (school_id) REFERENCES School(school_id)
);

-- Create Table for Participation
CREATE TABLE Participation (
    participation_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    event_id INT,
    age_category VARCHAR(50),
    discipline VARCHAR(100),
    result VARCHAR(50),
    team_or_individual VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

-- Create Table for Team
CREATE TABLE Team (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(255),
    event_id INT,
    coach_name VARCHAR(100),
    team_manager_name VARCHAR(100),
    photo_coach TEXT,
    photo_manager TEXT,
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

-- Create Table for IncomeExpenditure
CREATE TABLE IncomeExpenditure (
    income_expenditure_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT,
    income_amount DECIMAL(10, 2),
    income_source VARCHAR(255),
    expenditure_amount DECIMAL(10, 2),
    expenditure_category VARCHAR(255),
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

-- Insert values into School table
INSERT INTO School (school_name, postal_address, telephone_numbers, principal_name, principal_signature)
VALUES ('Delhi Public School', 'Mathura Road, New Delhi', '011-23356789', 'Rajesh Kumar', 'Signature1'),
       ('St. Xavier\'s High School', 'Vasant Vihar, New Delhi', '011-26524567', 'Anita Sharma', 'Signature2'),
       ('Kendriya Vidyalaya', 'Sector 8, R.K. Puram, New Delhi', '011-26111234', 'Suresh Gupta', 'Signature3');

-- Insert values into ObserverReport table
INSERT INTO ObserverReport (observer_name, postal_address, telephone_number, administrative_rating, technical_rating, overall_standard, suggestions)
VALUES ('Manoj Verma', 'Dwarka, New Delhi', '011-25095324', 'Excellent', 'Good', 'High', 'Improve event scheduling'),
       ('Sonia Mehta', 'Rohini, New Delhi', '011-27545123', 'Good', 'Excellent', 'Moderate', 'Increase participant capacity'),
       ('Ravi Singh', 'Mayur Vihar, New Delhi', '011-22785643', 'Very Good', 'Good', 'High', 'Focus on technical training');

-- Insert values into Event table
INSERT INTO Event (event_name, level, start_date, end_date, organizing_school_id, observer_report_id)
VALUES ('Inter-School Sports Meet', 'National', '2024-12-01', '2024-12-05', 1, 1),
       ('Zonal Debate Competition', 'Zone', '2024-11-15', '2024-11-16', 2, 2),
       ('Cluster Science Exhibition', 'Cluster', '2024-10-20', '2024-10-21', 3, 3);

-- Insert values into Student table
INSERT INTO Student (student_name, class, admission_no, dob, cbse_registration_no, photo, school_id)
VALUES ('Amit Patel', '10th', 'DPS12345', '2008-05-14', 'CBSE20231567', 'Photo1', 1),
       ('Neha Kapoor', '11th', 'XAV23456', '2007-08-20', 'CBSE20231890', 'Photo2', 2),
       ('Rahul Sharma', '12th', 'KV34567', '2006-02-25', 'CBSE20231234', 'Photo3', 3);

-- Insert values into Participation table
INSERT INTO Participation (student_id, event_id, age_category, discipline, result, team_or_individual)
VALUES (1, 1, 'Under 16', '100m Race', '1st', 'Individual'),
       (2, 2, 'Under 19', 'Debate', '2nd', 'Individual'),
       (3, 3, 'Under 19', 'Science Model', '1st', 'Team');

-- Insert values into Team table
INSERT INTO Team (team_name, event_id, coach_name, team_manager_name, photo_coach, photo_manager)
VALUES ('Science Wizards', 3, 'Vikas Yadav', 'Priya Mehta', 'PhotoCoach1', 'PhotoManager1'),
       ('Debate Champs', 2, 'Sunil Sharma', 'Kavita Jain', 'PhotoCoach2', 'PhotoManager2'),
       ('Track Stars', 1, 'Rahul Verma', 'Deepa Singh', 'PhotoCoach3', 'PhotoManager3');

-- Insert values into IncomeExpenditure table
INSERT INTO IncomeExpenditure (event_id, income_amount, income_source, expenditure_amount, expenditure_category)
VALUES (1, 50000.00, 'Sponsorship', 30000.00, 'Accommodation'),
       (2, 30000.00, 'Grant', 15000.00, 'Prizes'),
       (3, 45000.00, 'Entry Fees', 20000.00, 'Logistics');
