-- challenge start

SELECT  e.emp_no,
        e.last_name,
        e.first_name,
		tt.title,
        tt.from_date,
        tt.to_date
INTO retirement_titles
FROM employees AS e
    INNER JOIN titles AS tt
        ON (e.emp_no = tt.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31');
	
SELECT * FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles

-- retrieve the number of retiring employees by their most recent job title
SELECT COUNT(ut.title) AS retiree_count,
	ut.title
	
	INTO retiring_titles	
	FROM unique_titles as ut
	GROUP BY title
	ORDER BY retiree_count DESC;

SELECT * FROM retiring_titles

DROP TABLE mentorship_eligibility CASCADE;

-- Create the mentorship table

SELECT  e.emp_no,
		e.first_name,
        e.last_name,
		e.birth_date,
		tt.from_date,
		tt.to_date,
		tt.title
INTO mentorship1_eligibility
FROM employees AS e 
    INNER JOIN titles AS tt
        ON (e.emp_no = tt.emp_no)
	WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
		 AND (tt.to_date = '9999-01-01')
	ORDER BY emp_no ASC;

SELECT * FROM mentorship1_eligibility

-- Use Distinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
birth_date,
from_date,
to_date,
title

INTO mentorship_eligibility
FROM mentorship1_eligibility
ORDER BY emp_no, to_date DESC;

SELECT * FROM mentorship_eligibility

--looking for how many folks are between 1955-1964
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
-- INTO emp_info_1956_1964
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1956-01-01' AND '1964-12-31')
	 AND (de.to_date = '9999-01-01');
	 
-- Count of all active employees
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
--INTO emp_info_all
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (de.to_date = '9999-01-01');


