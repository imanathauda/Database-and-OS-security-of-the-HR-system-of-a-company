CREATE TABLE Department (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(50) NOT NULL,
  department_description VARCHAR(100)
);

CREATE TABLE Employee (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(50) NOT NULL,
  employee_mobile VARCHAR(20),
  employee_email VARCHAR(50),
  employee_username VARCHAR(50) NOT NULL,
  employee_password VARCHAR(50) NOT NULL,
  employee_address VARCHAR(100),
  role_name VARCHAR(50) NOT NULL,
  department_id INT, -- Reference the department_id
  FOREIGN KEY (department_id) REFERENCES Department(department_id),
CONSTRAINT depid_chk CHECK (REGEXP_LIKE(employee_mobile, '[D][0-9][0-9][0-9]')),
 CONSTRAINT email_chk CHECK (REGEXP_LIKE(employee_email, '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))
);

CREATE TABLE Salary (
  salary_id INT PRIMARY KEY,
  salary_employee_id INT NOT NULL,
  salary_amount DECIMAL(10,2) NOT NULL,
  salary_date DATE NOT NULL,
  FOREIGN KEY (salary_employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE Training (
  training_id INT PRIMARY KEY,
  training_employee_id INT NOT NULL,
  training_registration VARCHAR(50) NOT NULL,
  training_name VARCHAR(50) NOT NULL,
  training_type VARCHAR(50) NOT NULL,
  training_year INT NOT NULL,
  training_description VARCHAR(100),
  FOREIGN KEY (training_employee_id) REFERENCES Employee(employee_id),
constraint Train_type check(training_type IN('In-person','Online'))
);

CREATE TABLE Appraisal (
  appraisal_id INT PRIMARY KEY,
  appraisal_employee_id INT NOT NULL,
  appraisal_name VARCHAR(50) NOT NULL,
  appraisal_type VARCHAR(50) NOT NULL,
  appraisal_description VARCHAR(100),
  FOREIGN KEY (appraisal_employee_id) REFERENCES Employee(employee_id)
);

INSERT INTO Department VALUES
(1, 'Sales', 'Sales department'),
(2, 'Marketing', 'Marketing department'),
(3, 'Human Resources', 'Human Resources department'),
(4, 'Finance', 'Finance department'),
(5, 'Information Technology', 'IT department'),
(6, 'Operations', 'Operations department'),
(7, 'Customer Service', 'Customer Service department'),
(8, 'Research and Development', 'R&D department'),
(9, 'Legal', 'Legal department'),
(10, 'Public Relations', 'PR department');

INSERT INTO Employee VALUES
(1, 'John Smith', '555-1234', 'john@company.com', 'jsmith', 'password123', '123 Main St.', 'Manager', 4),
(2, 'Jane Doe', '555-5678', 'jane@company.com', 'jdoe', 'password456', '456 Oak St.', 'Employee', 7),
(3, 'Bob Johnson', '555-9012', 'bob@company.com', 'bjohnson', 'password789', '789 Elm St.', 'Employee', 6),
(4, 'Sarah Lee', '555-3456', 'sarah@company.com', 'slee', 'passwordabc', '234 Maple St.', 'Manager', 9),
(5, 'Tom Jones', '555-7890', 'tom@company.com', 'tjones', 'passworddef', '567 Pine St.', 'Employee', 3),
(6, 'Emily Chen', '555-2345', 'emily@company.com', 'echen', 'passwordghi', '890 Cedar St.', 'Manager', 5),
(7, 'David Kim', '555-6789', 'david@company.com', 'dkim', 'passwordjkl', '123 Elm St.', 'Employee', 7),
(8, 'Amy Patel', '555-0123', 'amy@company.com', 'apatel', 'passwordmno', '456 Maple St.', 'Employee', 5),
(9, 'Mike Brown', '555-4567', 'mike@company.com', 'mbrown', 'passwordpqr', '789 Pine St.', 'Employee', 4),
(10, 'Karen Lee', '555-8901', 'karen@company.com', 'klee', 'passwordstu', '234 Cedar St.', 'Manager', 1);

INSERT INTO Salary VALUES
(1, 1, 50000.00, TO_DATE('2023-01-01','YYYY-MM-DD')),
(2, 2, 40000.00, TO_DATE('2023-01-01','YYYY-MM-DD')),
(3, 3, 45000.00, TO_DATE('2023-01-01','YYYY-MM-DD')),
(4, 4, 55000.00, TO_DATE('2023-01-01','YYYY-MM-DD')),
(5, 5, 35000.00, TO_DATE('2023-01-01','YYYY-MM-DD')),
(6, 6, 60000.00, TO_DATE('2023-01-01','YYYY-MM-DD')),
(7, 7, 40000.00, TO_DATE('2023-01-01','YYYY-MM-DD')),
(8, 8, 45000.00, TO_DATE('2023-01-01','YYYY-MM-DD')),
(9, 9, 50000.00, TO_DATE('2023-01-01','YYYY-MM-DD')),
(10, 10, 55000.00,TO_DATE('2023-01-01','YYYY-MM-DD'));

INSERT INTO Training VALUES
(1, 1, '12345', 'Sales Training', 'In-person', 2023, 'Training for sales'),
(2, 2, '23456', 'Marketing 101', 'Online', 2022, 'Introduction to marketing'),
(3, 3, '34567', 'Sales Techniques', 'In-person', 2023, 'Advanced sales techniques'),
(4, 1, '45678', 'Management 101', 'Online', 2021, 'Introduction to management'),
(5, 4, '56789', 'Leadership Training', 'In-person', 2023, 'Training for leadership skills'),
(6, 5, '67890', 'Customer Service', 'Online', 2022, 'Training for customer service skills'),
(7, 6, '78901', 'Marketing Strategies', 'In-person', 2023, 'Advanced marketing strategies'),
(8, 7, '89012', 'Sales Management', 'Online', 2021, 'Training for sales management'),
(9, 8, '90123', 'Social Media Marketing', 'In-person', 2022, 'Training for social media marketing'),
(10, 9, '01234', 'Negotiation Skills', 'In-person', 2023, 'Training for negotiation skills');

INSERT INTO Appraisal VALUES
(1, 1, 'Mid-year review', 'Performance', 'Review of employee performance'),
(2, 2, 'End-of-year review', 'Performance', 'Review of employee performance'),
(3, 3, 'Quarterly review', 'Performance', 'Review of employee performance'),
(4, 4, 'Promotion review', 'Promotion', 'Review of employee eligibility for promotion'),
(5, 5, 'Leadership review', 'Leadership', 'Review of employee leadership skills'),
(6, 6, 'Marketing review', 'Marketing', 'Review of employee marketing skills'),
(7, 7, 'Sales review', 'Sales', 'Review of employee sales skills'),
(8, 8, 'Customer service review', 'Customer service', 'Review of employee customer service skills'),
(9, 9, 'Negotiation review', 'Negotiation', 'Review of employee negotiation skills'),
(10, 10, 'Management review', 'Management', 'Review of employee management skills');

Select * from Department;
Select * from Employee;
Select * from Salary;
Select * from Training;
Select * from Appraisal;

-- Create Users
CREATE USER sys_admin IDENTIFIED BY Group47;
CREATE USER manager IDENTIFIED BY Group47;
CREATE USER executive IDENTIFIED BY Group47;


--Grant full permissions to system admin

GRANT DBA TO sys_admin;

-- Create a custom role for the Manager

CREATE ROLE role_manager;

,-- Grant read and write permissions

GRANT SELECT, INSERT, UPDATE, DELETE ON Employee TO role_manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Department TO role_manager;
GRANT SELBCT, INSERT, UPDATE, DELETE ON Salary TO role_manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Training TO role_manager;
GRANT SELECT, INSERT, UPDATE, DELBTE ON Appraisal TO role_manager;

-- Grant the role to the Manager user

GRANT role_manager TO manager;

--Create a custom role for the Executive

CREATE ROLE role_executive;

-- Grant read-only permissions

GRANT SELECT ON Employee TO role_executive;
GRANT SELECT ON Department TO role_executive;
GRANT SELECT ON Salary TO role_executive;
GRANT SELECT ON Training TelNo TO role_executive;
GRANT SELECT ON Appraisal TO role_executive;


-- Grant the role to the Executive user

GRANT role_executive TO executive;



CREATE VIEW manager_view AS
SELECT e.employee_id, e.employee_name, e.employee_mobile, e.employee_email, s.salary_amount
FROM Employee e
JOIN Salary s ON e.employee_id = s.salary_employee_id
WHERE e.role_name = 'Manager';


-- Enable VPD
EXEC DBMS_RLS.ADD_POLICY('HR', 'EMPLOYEE', 'manager_policy', 'manager_role', 'TRUE', 'SELECT', 'manager_policy_check', 'ENABLE');

-- Create Policy Function
CREATE OR REPLACE FUNCTION manager_policy_check (
    p_schema  VARCHAR2,
    p_object  VARCHAR2)
RETURN VARCHAR2
IS
BEGIN
    RETURN 'e.role_name = ''Manager''';
END manager_policy_check;



-- Enable TDE for Sensitive Columns
ALTER TABLE Employee MODIFY (employee_mobile ENCRYPT USING 'AES256' NO SALT);
ALTER TABLE Employee MODIFY (employee_email ENCRYPT USING 'AES256' NO SALT);

BEGIN
    DBMS_REDACT.ADD_POLICY(
        object_schema  => 'HR',
        object_name    => 'EMPLOYEE',
        column_name    => 'EMPLOYEE_EMAIL',
        policy_name    => 'email_masking_policy',
        function_type  => DBMS_REDACT.PARTIAL,
        function_parameters => '4, "*", 3',
        expression     => 'SYS_CONTEXT(''USERENV'', ''SESSION_USER'') = ''CONSULTING_FIRM''');
END;
/


-- Create an FGA Policy
BEGIN
    DBMS_FGA.ADD_POLICY(
        object_schema  => 'HR',
        object_name    => 'EMPLOYEE',
        policy_name    => 'sensitive_data_select',
        audit_condition => 'UPPER(action_name) = ''SELECT''',
        audit_column    => 'EMPLOYEE_NAME, EMPLOYEE_EMAIL',
        handler_schema  => NULL,
        statement_types => 'SELECT',
        audit_trail     => DBMS_FGA.DB);
END;

/
