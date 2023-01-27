-- List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no ,
	   employees.last_name ,
	   employees.frist_name ,
	   employees.sex ,
	   salaries.salary
FROM employees  
JOIN salaries ON
employees.emp_no=salaries.emp_no

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT frist_name,
	   last_name,
	   hire_date
FROM employees
WHERE hire_date LIKE '%1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name 
SELECT dept_manager.dept_no ,
	   department.dept_name,
	   dept_manager.emp_no ,
	   employees.last_name ,
	   employees.frist_name 	   
FROM dept_manager
JOIN department ON
dept_manager.dept_no=department.dept_no
JOIN employees ON
dept_manager.emp_no=employees.emp_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT dept_emp.dept_no ,	   
	   dept_emp.emp_no ,
	   employees.last_name ,
	   employees.frist_name,
	   department.dept_name
FROM dept_emp
JOIN department ON
dept_emp.dept_no=department.dept_no
JOIN employees ON
dept_emp.emp_no=employees.emp_no
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT frist_name,
	   last_name,
	   sex
FROM employees
WHERE frist_name in('Hercules')
AND last_name like 'B%'
--List each employee in the Sales department, including their employee number, last name, and first name
SELECT	emp_no,
		last_name,
		frist_name
FROM employees
WHERE emp_no IN
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
	(
	  SELECT dept_no 
	  FROM department
	  WHERE dept_name = 'Sales'	
	)
)
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
SELECT 	employees.emp_no,
		employees.last_name,
		employees.frist_name,
		department.dept_name
FROM employees
JOIN dept_emp ON
employees.emp_no=dept_emp.emp_no
JOIN department ON
dept_emp.dept_no=department.dept_no
WHERE dept_name IN ('Sales','Development');

--List the frequency counts, in descending order, of all the employee last names
SELECT last_name,
	   COUNT(last_name)	as no_of_last_name   
FROM employees
GROUP BY last_name
ORDER BY no_of_last_name DESC
