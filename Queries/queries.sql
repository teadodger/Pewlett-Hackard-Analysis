-- Retirement eligibility
SELECT first_name, last_name
	FROM employees
	WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
--INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

        
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
-- INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

-- Reorder the table by emp_no
SELECT * FROM retirement_titles
ORDER BY emp_no ASC;

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO retirement_current_title
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM retirement_current_title

-- Create the mentorship table

SELECT  e.emp_no,
		e.first_name,
        e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		tt.title
INTO mentorship_eligibilty
FROM employees AS e 
	INNER JOIN dept_emp AS de 
		ON (e.emp_no = de.emp_no)
    INNER JOIN titles AS tt
        ON (de.emp_no = tt.emp_no)
	WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	ORDER BY emp_no ASC;
	
SELECT * FROM mentorship_eligibilty