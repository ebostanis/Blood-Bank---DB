SELECT salary.emp_id, emp_name, sal_date
FROM employees join salary on salary.emp_id = employees.emp_id
WHERE salary.sal_amount>1000;