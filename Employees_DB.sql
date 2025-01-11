-- Drop tables if exist
DROP TABLE dept_emp,
           dept_manager,
           titles,
           salaries, 
           employee, 
           departments;

CREATE TABLE employee (
    employee_ID INT   NOT NULL,
    employee_title_ID VARCHAR   NOT NULL,
    employee_bday VARCHAR   NOT NULL,
    first_name VARCHAR(100)   NOT NULL,
    last_name VARCHAR(100)   NOT NULL,
    sex VARCHAR(5)   NOT NULL,
    hire_date VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_employee PRIMARY KEY (
        employee_ID)
);

SELECT * FROM employee;

CREATE TABLE departments (
    department_ID VARCHAR(15)   NOT NULL,
    department_name VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        Department_ID)
);

SELECT * FROM departments;

CREATE TABLE dept_manager (
    department_ID VARCHAR(15)   NOT NULL,
    employee_ID INT  NOT NULL,
    CONSTRAINT pk_managers PRIMARY KEY (
        Employee_ID)
);

SELECT * FROM dept_manager;

CREATE TABLE dept_emp (
    employee_ID INT  NOT NULL,
    department_ID VARCHAR(15)   NOT NULL
    --CONSTRAINT pk_Employee_Department PRIMARY KEY (
        --Employee_ID, Department_ID)
     --)
);

SELECT * FROM dept_emp;

CREATE TABLE titles (
    title_ID VARCHAR(20)   NOT NULL,
    title VARCHAR(20)   NOT NULL,
    CONSTRAINT pk_Job_Title PRIMARY KEY (
        title_ID)
);

SELECT * FROM titles;

CREATE TABLE salaries (
    employee_ID INT   NOT NULL,
    salary INT   NOT NULL,
    CONSTRAINT pk_Saleries PRIMARY KEY (
        Employee_ID)
);

SELECT * FROM salaries

ALTER TABLE employee ADD CONSTRAINT fk_Employee_Employee_ID FOREIGN KEY(Employee_ID)
REFERENCES salaries (Employee_ID);

ALTER TABLE employee ADD CONSTRAINT fk_Employee_Employee_Title_ID FOREIGN KEY(Employee_Title_ID)
REFERENCES titles (Title_ID);

ALTER TABLE dept_emp ADD CONSTRAINT fk_Employee_Department_Employee_ID FOREIGN KEY(Employee_ID)
REFERENCES employee (Employee_ID);

ALTER TABLE dept_emp ADD CONSTRAINT fk_Employee_Department_Department_ID FOREIGN KEY(Department_ID)
REFERENCES departments (Department_ID);

ALTER TABLE dept_manager ADD CONSTRAINT fk_Managers_Department_ID FOREIGN KEY(Department_ID)
REFERENCES departments (Department_ID);

--Question 1
SELECT e.employee_ID, e.last_Name, e.first_Name, e.sex, s.salary 
FROM employee e
INNER JOIN salaries s
ON (e.employee_ID = s.employee_ID);


--Question 2
SELECT first_Name, last_Name, hire_date
FROM employee
WHERE hire_date LIKE '%1986%';

--Question 3
SELECT d.department_ID, d.department_name, e.employee_ID, e.last_Name, e.first_Name
FROM employee e
INNER JOIN dept_manager m
ON m.employee_ID = e.employee_ID
INNER JOIN departments d
ON d.department_ID = m.department_ID;

--Question 4
SELECT e.employee_ID, e.last_Name, e.first_Name, d.department_name
FROM employee e
INNER JOIN dept_emp g
ON g.employee_ID = e.employee_ID
INNER JOIN departments d
ON d.department_ID = g.department_ID;

--Question 5
SELECT first_name, last_name, sex
FROM employee
Where first_name = 'Hercules' AND last_name LIKE '%B%';

--Question 6
SELECT e.employee_ID, e.last_Name, e.first_Name, d.department_Name
FROM employee e
INNER JOIN dept_emp g
ON g.employee_ID = e.employee_ID
INNER JOIN departments d
ON d.department_ID = g.department_ID
WHERE d.department_name = 'Sales';

--Question 7
SELECT e.employee_ID, e.last_Name, e.first_Name, d.department_Name
FROM employee e
INNER JOIN dept_emp g
ON g.Employee_ID = e.employee_ID
INNER JOIN departments d
ON d.department_ID = g.department_ID
WHERE d.department_name = 'Sales' OR d.department_name = 'Development';

--Question 8
SELECT last_Name, COUNT(last_name) AS "Frequency"
FROM employee
GROUP BY last_name
ORDER BY last_name DESC;