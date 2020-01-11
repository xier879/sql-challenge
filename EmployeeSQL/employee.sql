SELECT * FROM employees LIMIT 20;
SELECT * FROM dept_manager LIMIT 20;
SELECT * FROM departments;


--List each employee: employee number, last name, first name, gender, and salary.
-- join employees and salary tables 
--https://www.w3schools.com/sql/sql_join.asp
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, 
salaries.salary
FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no;

--List employees who were hired in 1986
--[S]ingle quotes are for [S]trings ; [D]ouble quotes are for [D]atabase identifiers;
--https://www.w3schools.com/sql/sql_dates.asp
SELECT emp_no, first_name, last_name, hire_date 
FROM employees
WHERE hire_date >= '1986-01-01' and hire_date < '1987-01-01'

--list the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.

--https://www.geeksforgeeks.org/joining-three-tables-sql/
SELECT employees.emp_no, employees.first_name, employees.last_name,
dept_manager.from_date, dept_manager.to_date,dept_manager.dept_no,
departments.dept_name
FROM employees JOIN dept_manager ON employees.emp_no = dept_manager.emp_no 
JOIN departments ON dept_manager.dept_no = departments.dept_no;


--list the department of each employee with the following information: 
--employee number, last name, first name, and department name.
--https://www.geeksforgeeks.org/joining-three-tables-sql/    | second approach 
SELECT first_name, last_name, 
dept_name FROM employees e, dept_emp d, 
departments p WHERE e.emp_no = d.emp_no AND 
d.dept_no = p.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
--http...09-SQL/2/Activities/07-Stu_Subqueries/Solved/query.sql
--only if there is no ambugious reference 
SELECT first_name, last_name 
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--list all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
-- https://stackoverflow.com/questions/354070/sql-join-where-clause-vs-on-clause
SELECT employees.emp_no, employees.first_name, employees.last_name,
departments.dept_name 
FROM employees JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
JOIN departments on dept_emp.dept_no = departments.dept_no and departments.dept_name = 'Sales'

--liist all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.first_name, employees.last_name,
departments.dept_name 
FROM employees JOIN dept_emp ON employees.emp_no = dept_emp.emp_no 
JOIN departments on dept_emp.dept_no = departments.dept_no and departments.dept_name = 'Sales'
or departments.dept_name = 'Development'

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
--https...09-SQL/2/Activities/02-Ins_Aggregates/Solved/query.sql

SELECT last_name, COUNT(first_name) AS "ct last name" FROM employees
GROUP BY last_name
ORDER BY "ct last name" DESC;