select doctor.emp_id,emp_name,emp_age,emp_gender,emp_phNo,doc_specialty
from employees join doctor on employees.emp_id = doctor.emp_id
where doctor.doc_specialty = "Ογκολόγος";