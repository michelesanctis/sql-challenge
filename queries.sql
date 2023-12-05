--JOINING TABLES

-- 1) List the employee number, last name, first name, sex, and salary of each employee 

SELECT e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM employees as e
RIGHT JOIN salaries as s ON
e.emp_no = s.emp_no;

-- 2) List the first name, last name, and hire date for the employees who were hired in 1986

SELECT first_name,
	last_name,
	hire_date
FROM employees
WHERE extract(year from hire_date) = 1986;

--3) List the manager of each department along with their department number, department name, employee number, last name, and first name

SELECT d.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
	--e.emp_title_id,
	--e.hire_date,
	--s.salary
FROM departments as d
INNER JOIN dept_manager as dm ON 
d.dept_no = dm.dept_no
INNER JOIN employees as e ON
dm.emp_no = e.emp_no
INNER JOIN salaries as s ON
e.emp_no = s.emp_no
ORDER BY d.dept_no, e.last_name, s.salary;

--4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT de.dept_no,
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM dept_employees as de
INNER JOIN employees as e ON 
de.emp_no = e.emp_no
INNER JOIN departments as d ON
d.dept_no = de.dept_no
ORDER BY e.emp_no; 

-- 5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules' and  
lower(last_name) LIKE 'b%'
ORDER BY last_name;

-- 6) List each employee in the Sales department, including their employee number, last name, and first name.

SELECT de.emp_no,
	e.last_name,
	e.first_name
FROM dept_employees as de
INNER JOIN employees as e ON
de.emp_no = e.emp_no
INNER JOIN departments as d ON
d.dept_no = de.dept_no
WHERE lower(d.dept_name) = 'sales'
ORDER BY e.emp_no;

-- 7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM dept_employees as de
INNER JOIN employees as e ON
e.emp_no = de.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no
WHERE lower(d.dept_name) = 'sales' or lower(d.dept_name) = 'development'
ORDER BY e.emp_no;

-- 8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

SELECT last_name,
COUNT (last_name) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
