-- Deliverable 1: The Number of Retiring Employees by Title
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
order by e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO uniq_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;

-- Retiring Titles
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM uniq_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;