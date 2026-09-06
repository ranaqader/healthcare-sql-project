-- Healthcare SQL Project
-- This project uses a fictional healthcare database.

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    insurance VARCHAR(50)
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    appointment_date DATE,
    department VARCHAR(50),
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE billing (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Patient data
INSERT INTO patients VALUES
(1, 'Sarah Johnson', 34, 'Female', 'Aetna'),
(2, 'Michael Brown', 52, 'Male', 'Blue Cross'),
(3, 'Emily Davis', 27, 'Female', 'UnitedHealthcare'),
(4, 'James Wilson', 61, 'Male', 'Aetna'),
(5, 'Olivia Martinez', 45, 'Female', 'Cigna'),
(6, 'Daniel Smith', 38, 'Male', 'Blue Cross'),
(7, 'Sophia Anderson', 23, 'Female', 'Aetna'),
(8, 'William Taylor', 70, 'Male', 'Medicare');

-- Appointment data
INSERT INTO appointments VALUES
(101, 1, '2026-01-10', 'Cardiology', 'Completed'),
(102, 2, '2026-01-12', 'Orthopedics', 'Completed'),
(103, 3, '2026-01-15', 'Dermatology', 'Cancelled'),
(104, 4, '2026-01-18', 'Cardiology', 'Completed'),
(105, 5, '2026-01-20', 'Primary Care', 'Completed'),
(106, 6, '2026-01-22', 'Orthopedics', 'Scheduled'),
(107, 7, '2026-01-25', 'Dermatology', 'Completed'),
(108, 8, '2026-01-28', 'Cardiology', 'Scheduled');

-- Billing data
INSERT INTO billing VALUES
(201, 1, 450.00, 'Paid'),
(202, 2, 1200.00, 'Unpaid'),
(203, 3, 300.00, 'Paid'),
(204, 4, 1800.00, 'Unpaid'),
(205, 5, 650.00, 'Paid'),
(206, 6, 950.00, 'Paid'),
(207, 7, 250.00, 'Unpaid'),
(208, 8, 2200.00, 'Unpaid');
