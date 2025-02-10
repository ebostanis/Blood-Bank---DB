CREATE USER 'administrator'@'localhost' IDENTIFIED BY 'allkey';
GRANT ALL PRIVILEGES ON blood_bank.* TO 'administrator'@'localhost'; 


#==================================================================================================

#-- Employees
CREATE USER 'employees'@'%' IDENTIFIED BY 'emppassword';
GRANT INSERT, UPDATE ON blood_bank.employees TO 'employees'@'%';

GRANT INSERT, UPDATE ON blood_bank.salary TO 'employees'@'%';

GRANT INSERT, UPDATE ON blood_bank.donor TO 'employees'@'%';
#=================================================================

#-- Donor
CREATE USER 'donor'@'%' IDENTIFIED BY 'donorpassword';
GRANT INSERT, UPDATE ON blood_bank.donor TO 'donor'@'%';
#========================================================================

#-- Patient
CREATE USER 'patient'@'%' IDENTIFIED BY 'patpassword';
GRANT INSERT, UPDATE ON blood_bank.patient TO 'patient'@'%';
#========================================================================


#-- Hospital
CREATE USER 'hospital'@'%' IDENTIFIED BY 'hosppassword';
GRANT INSERT, UPDATE ON blood_bank.patient TO 'hospital'@'%';

GRANT INSERT, UPDATE ON blood_bank.payment TO 'hospital'@'%';

#========================================================================================

