-- 1. Display all information in the tables EMP and DEPT. 
Use hr;
SELECT *
FROM employees;
SELECT *
FROM  departments;
-- 2. Display only the hire date and employee name for each employee. 
SELECT hire_date,first_name 
FROM employees;

-- 3. Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title 
SELECT concat(first_name,", ",job_id)  AS "Employee & Title" 
FROM employees;

--  4. Display the hire date, name and department number for all clerks.

SELECT hire_date,first_name,department_id
FROM employees
WHERE job_id like '%CLERK';

-- 5 Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT

SELECT CONCAT(employee_id,",",
first_name,",", 
last_name,",", 
email,",",  
phone_number,",", 
hire_date,",",  
job_id,",",  
salary,",", 
commission_pct,",",  
manager_id,",", 
department_id) AS THE_OUTPUT
FROM employees;

-- 6 Display the names and salaries of all employees with a salary greater than 2000.

SELECT first_name,salary
FROM employees
WHERE salary>2000;

-- 7 Display the names and dates of employees with the column headers "Name" and "Start Date"

SELECT first_name as NAME, hire_date as StartDate
FROM employees;

-- 8 Display the names and hire dates of all employees in the order they were hired. 

SELECT first_name,hire_date 
FROM employees
order by hire_date;

-- 9 Display the names and salaries of all employees in reverse salary order. 
SELECT
first_name,salary
FROM employees
order by salary desc;

-- 10 Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.
SELECT first_name,department_id,salary 
FROM employees
where commission_pct is not null order by salary desc; 

-- 11. Display the last name and job title of all employees who do not have a manager 
SELECT last_name,job_id
FROM employees 
WHERE manager_id is null;

-- 12. Display the last name, job, and salary for all employees whose job is sales representative  or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
SELECT last_name,job_id,salary
FROM employees
WHERE  salary <>2500 AND salary<>3500 AND  salary<>5000 AND job_id in ('ST_CLERK','SA_REP');




-- 2.1 Display the maximum, minimum and average salary and commission earned. 
SELECT MAX(salary),MIN(salary),Avg(salary),MAX(commission_pct),MIN(commission_pct),Avg(commission_pct)
FROM employees;

-- 2.2 Display the department number, total salary payout and total commission payout for each department.
SELECT department_id,sum(salary),sum(commission_pct)
FROM employees
group by department_id;

-- 2.3 Display the department number and number of employees in each department.
SELECT department_id, count(*)
FROM employees
group by department_id;

-- 2.4) Display the department number and total salary of employees in each department. 
SELECT department_id , SUM(salary) AS Total_Salary
FROM employees
GROUP BY  department_id;
-- 2.5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name
SELECT first_name
FROM employees
WHERE commission_pct is null;

-- 2.6) Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately
SELECT first_name,department_id,
CASE 
when commission_pct is null then 'No commission'
when commission_pct is not null then commission_pct
END as commission
FROM employees;

-- 2.7) Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns appropriately

SELECT first_name,salary,
CASE 
when commission_pct is null then 'No commission'
when commission_pct is not null then commission_pct*2
END as commission
FROM employees;

-- 2.8) Display the employee's name, department id who have the first name same as another employee in the same department
SELECT first_name,department_id
FROM employees group by first_name,department_id
having COUNT(first_name)>1 and count(department_id)>1;

-- 2.9) Display the sum of salaries of the employees working under each Manager.
SELECT SUM(salary) , manager_id
FROM employees
GROUP BY manager_id
having manager_id is not null;

-- 2.10) Select the Managers name, the count of employees working under and the department ID of the manager.
SELECT m.first_name as Manager_name, count(e.employee_id), m.department_id, m.manager_id
FROM employees as e
join employees as m on
e.manager_id=m.employee_id
group by m.employee_id;

-- 2.11) Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a!



-- 2.12) Display the average of sum of the salaries and group the result with the department id. Order the result with the department id. 
SELECT avg(salary),department_id
FROM employees
GROUP BY department_id 
HAVING department_id is not null
ORDER BY department_id;

-- 2.13) Select the maximum salary of each department along with the department id 
SELECT MAX(salary),department_id
FROM employees
GROUP BY department_id 
HAVING department_id is not null;

-- 2.14) Display the commission, if not null display 10% of salary, if null display a default value 1
SELECT
CASE 
WHEN commission_pct is not null then salary/10
WHEN commission_pct is null then 1
END as commission
FROM employees;

-- 3.1. Write a query to display the last name, department number, department name for all employees.

SELECT e.last_name,d.department_id,d.department_name
FROM employees as e join departments as d
on e.department_id=d.department_id;

-- 3.2. Create a unique list of all jobs that are in department 4. Include the location of the department in the output.


-- 3.3. Write a query to display the employee last name,department name,location id and city of all employees who earn commission.
SELECT e.last_name,d.department_name,l.location_id, l.city
FROM departments as d join employees as e on e.department_id=d.department_id
join locations as l on d.location_id=l.location_id where e.commission_pct is not null;

-- 3.4. Display the employee last name and department name of all employees who have an 'a' in their last name 
SELECT e.last_name,d.department_name
FROM departments as d join employees as e on e.department_id=d.department_id
WHERE e.last_name like '%a%';

-- 3.5. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA. 
SELECT 

-- 3.6. Display the employee last name and employee number along with their manager's last name and manager number. 

SELECT e.last_name,e.employee_id,m.last_name as manager_lastname,m.employee_id as manager_id
FROM employees as e join employees as m on e.manager_id=m.employee_id;

-- 3.7. Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager). 


-- 3.8. Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee. 


-- 3.9. Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) 

SELECT e.first_name,j.job_title,d.department_name,e.salary,case
when e.salary>=50000 then 'A'
when e.salary>=30000 then 'B'
when e.salary<30000 then 'C'
END as grade
FROM employees as e join departments as d on e.department_id=d.department_id
join jobs as j on e.job_id=j.job_id;

-- 3.10. Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. Label the columns as Employee name, emp_hire_date,manager name,man_hire_date



-- 4.1. Write a query to display the last name and hire date of any employee in the same department as SALES. 


-- 4.2. Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary. 
SELECT employee_id,last_name
FROM employees
WHERE salary>(SELECT AVG(salary) from employees)
order by salary;

-- 4.3. Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u

-- 4.5. Display the last name and salary of every employee who reports to FILLMORE.
 SELECT salary
 from employees where first_name like '%FILLMORE%';
 
 -- 4.6. Display the department number, last name, and job ID for every employee in the OPERATIONS department. 
 SELECT e.department_id,e.last_name,e.job_id
 FROM employees as e join departments as d on e.department_id=d.department_id
 WHERE d.department_name="Operations";
 
 select * from employees;
 
 -- 4.7. Modify the above query to display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work in a department with any employee with a 'u'in their name.alter



-- 4.8. Display the names of all employees whose job title is the same as anyone in the sales dept.
SELECT first_name
FROM employees 
WHERE job_id='SA_MAN' or job_id='SA_REP';

-- 4.9. Write a compound query to produce a list of employees showing raise percentages, employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, employees in department 2 are given a 10% raise, employees in departments 4 and 5 are given a 15% raise, and employees in department 6 are not given a raise. 


-- 4.10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.
SELECT last_name,salary
FROM employees
order by salary desc LIMIT 3;

-- 4.11. Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column
SELECT first_name,salary,
CASE
WHEN commission_pct is null then 0
WHEN commission_pct is not null then commission_pct
END as commission
FROM employees;

-- 4.12. Display the Managers (name) with top three salaries along with their salaries and department information.
 select first_name as manager, salary, department_id,department_name
 from employees join departments using(department_id)
 where job_id like'%mgr'
 order by salary desc limit 4;
