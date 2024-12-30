CREATE DATABASE MYDBb
USE MYDBb


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

INSERT INTO Employees (EmployeeName, Email, PhoneNumber)
VALUES 
('Hamza', 'hamza@gmail.com', '0337-8022639'),
('ali', 'ali@gmail.com', '03333333333'),
('talal', 'talal@gmail.com', '034567892156'),
('rameez', 'rameez@gmail.com', '033645846515'),
('abdullah', 'abdullah@gmail.com', '035498454184');


CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY IDENTITY (1,1),
    ProjectName VARCHAR(50) NOT NULL,
    ProjectCost DECIMAL(10, 2) NOT NULL
);

INSERT INTO Projects (ProjectName, ProjectCost)
VALUES 
('LMS', 10000),
('ERP System', 20000),
('Website Redesign', 4000),
('E-Commerce Platform', 3000),
('Mobile App', 22000);

CREATE TABLE EmployeeProjects (
    EmployeeProjectID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    ProjectID INT NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

CREATE TABLE EmployeeProjects (
    EmployeeProjectID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
    ProjectID INT NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

INSERT INTO EmployeeProjects (EmployeeID, ProjectID)
VALUES 
(1, 1), 
(2, 1), 
(3, 2), 
(4, 3),
(5, 4),
(1, 4),
(3, 5); 

SELECT 
    e.EmployeeName, 
    p.ProjectName
FROM 
    EmployeeProjects ep
JOIN 
    Employees e ON ep.EmployeeID = e.EmployeeID
JOIN 
    Projects p ON ep.ProjectID = p.ProjectID;

	--CREATING THE VIEQ to Display all the project’s name along with the name of the assigned

	CREATE VIEW EmployeeProjectDetails AS
SELECT 
    e.EmployeeID,
    e.EmployeeName,
    p.ProjectName,
    p.ProjectCost
FROM 
    Employees e
JOIN 
    EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN 
    Projects p ON ep.ProjectID = p.ProjectID;

	-- Create view to display all the unique employees name

	CREATE VIEW UniqueEmployeeNames AS
SELECT DISTINCT EmployeeName
FROM Employees;


--Display all the projects whose cost is between 5000 and 10000

SELECT *
FROM Projects
WHERE ProjectCost BETWEEN 5000 AND 10000;

-- Display name of the employees whose name start with ‘A’

SELECT *
FROM Employees
WHERE EmployeeName LIKE 'A%';

--Display total cost of all projects
SELECT SUM(ProjectCost) AS TotalCost
FROM Projects;

-- Count all the employees
SELECT COUNT(*) AS EmployeeCount
FROM Employees;

-- Create views to display all the employees name who are working on project ‘LMS’

CREATE VIEW EmployeesOnLMS AS
SELECT 
    e.EmployeeName
FROM 
    Employees e
JOIN 
    EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN 
    Projects p ON ep.ProjectID = p.ProjectID
WHERE 
    p.ProjectName = 'LMS';



