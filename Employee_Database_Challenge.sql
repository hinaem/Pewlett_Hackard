--Deliverable 1 The number of Retiring Employees by title

SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	titless.title,
	titless.from_date,
	titless.to_date
INTO retirement_titles
FROM employees 
JOIN titless
ON employees.emp_no = titless.emp_no
WHERE employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31'

SELECT * FROM retirement_titles;

SELECT DISTINCT ON (emp_no) retirement_titles.emp_no, retirement_titles.first_name, retirement_titles.last_name, retirement_titles.title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles

SELECT COUNT (title) AS "count", title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC

SELECT * FROM retiring_titles


--Deliverable 2 The Employees Eligible for the Mentorship Program

SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
	employees.first_name,
	employees.last_name,
	employees.birth_date,
	dept_emp.from_date,
	dept_emp.to_date,
	titless.title
INTO mentorship_eligibility
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN titless ON employees.emp_no = titless.emp_no
WHERE (dept_emp.to_date = '9999-01-01') AND
(employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
ORDER BY employees.emp_no

SELECT * FROM mentorship_eligibility




