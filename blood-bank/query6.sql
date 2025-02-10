SELECT *
FROM department join patient on department.department_id = patient.department_id join hospital on department.hosp_id = hospital.hosp_id
WHERE hospital.hosp_id = 20;