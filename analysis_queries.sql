-- Healthcare SQL Project
-- Analysis Queries
-- Database: MySQL


-- 1. View all patients
SELECT *
FROM patients;


-- 2. Find patients older than 40
SELECT patient_id, name, age
FROM patients
WHERE age > 40;


-- 3. Count the number of patients by gender
SELECT gender, COUNT(*) AS patient_count
FROM patients
GROUP BY gender;


-- 4. Find all unpaid medical bills
SELECT patient_id, amount, payment_status
FROM billing
WHERE payment_status = 'Unpaid';


-- 5. Calculate the total amount of unpaid bills
SELECT SUM(amount) AS total_unpaid
FROM billing
WHERE payment_status = 'Unpaid';


-- 6. Find the average billing amount
SELECT AVG(amount) AS average_bill
FROM billing;


-- 7. Show each patient with their appointment information
SELECT
    patients.name,
    appointments.appointment_date,
    appointments.department,
    appointments.status
FROM patients
JOIN appointments
    ON patients.patient_id = appointments.patient_id;


-- 8. Count appointments by department
SELECT department, COUNT(*) AS appointment_count
FROM appointments
GROUP BY department
ORDER BY appointment_count DESC;


-- 9. Find patients who have unpaid bills
SELECT
    patients.name,
    billing.amount,
    billing.payment_status
FROM patients
JOIN billing
    ON patients.patient_id = billing.patient_id
WHERE billing.payment_status = 'Unpaid';


-- 10. Find the patient with the highest medical bill
SELECT
    patients.name,
    billing.amount
FROM patients
JOIN billing
    ON patients.patient_id = billing.patient_id
ORDER BY billing.amount DESC
LIMIT 1;


-- 11. Find completed appointments
SELECT
    patients.name,
    appointments.department,
    appointments.appointment_date
FROM patients
JOIN appointments
    ON patients.patient_id = appointments.patient_id
WHERE appointments.status = 'Completed';


-- 12. Calculate total billing by insurance provider
SELECT
    patients.insurance,
    SUM(billing.amount) AS total_billing
FROM patients
JOIN billing
    ON patients.patient_id = billing.patient_id
GROUP BY patients.insurance
ORDER BY total_billing DESC;
