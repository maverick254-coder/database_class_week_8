-- --------------------------
-- Clinic Booking System SQL
-- --------------------------

-- Create and use the database
CREATE DATABASE IF NOT EXISTS ClinicDB;
USE ClinicDB;

-- --------------------------
-- 1. Create Tables
-- --------------------------

CREATE TABLE IF NOT EXISTS Specialties (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Doctors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    specialty_id INT,
    FOREIGN KEY (specialty_id) REFERENCES Specialties(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE IF NOT EXISTS Appointments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    appointment_date DATETIME NOT NULL,
    reason TEXT,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(id) ON DELETE SET NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Treatments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    description TEXT NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Medications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dosage VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Prescriptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    treatment_id INT NOT NULL,
    medication_id INT NOT NULL,
    quantity INT NOT NULL,
    instructions TEXT,
    FOREIGN KEY (treatment_id) REFERENCES Treatments(id) ON DELETE CASCADE,
    FOREIGN KEY (medication_id) REFERENCES Medications(id) ON DELETE CASCADE
);

-- --------------------------
-- 2. Insert Sample Data
-- --------------------------

-- Insert into Specialties
INSERT INTO Specialties (name) VALUES
('General Medicine'),
('Pediatrics'),
('Dermatology'),
('Orthopedics');

-- Insert into Doctors
INSERT INTO Doctors (first_name, last_name, email, phone, specialty_id) VALUES
('Alice', 'Kimani', 'alice.kimani@clinic.com', '0700111222', 1),
('Brian', 'Otieno', 'brian.otieno@clinic.com', '0700333444', 2),
('Clara', 'Mwende', 'clara.mwende@clinic.com', '0700555666', 3);

-- Insert into Patients
INSERT INTO Patients (first_name, last_name, dob, gender, phone, email) VALUES
('James', 'Ouma', '1992-06-15', 'Male', '0711000001', 'james.ouma@gmail.com'),
('Linda', 'Wanjiku', '1988-10-05', 'Female', '0711000002', 'linda.wanjiku@gmail.com'),
('Michael', 'Mutiso', '2000-01-20', 'Male', '0711000003', 'michael.mutiso@gmail.com');

-- Insert into Appointments
INSERT INTO Appointments (doctor_id, patient_id, appointment_date, reason) VALUES
(1, 1, '2025-05-06 10:30:00', 'Fever and headache'),
(2, 2, '2025-05-06 11:00:00', 'Child vaccination'),
(3, 3, '2025-05-06 12:00:00', 'Skin rash');

-- Insert into Treatments
INSERT INTO Treatments (appointment_id, description, cost) VALUES
(1, 'Prescribed paracetamol and rest', 500.00),
(2, 'Administered measles vaccine', 1200.00),
(3, 'Applied antifungal cream', 800.00);

-- Insert into Medications
INSERT INTO Medications (name, dosage) VALUES
('Paracetamol', '500mg'),
('Measles Vaccine', 'Single dose'),
('Antifungal Cream', 'Apply twice daily');

-- Insert into Prescriptions
INSERT INTO Prescriptions (treatment_id, medication_id, quantity, instructions) VALUES
(1, 1, 10, 'Take 1 tablet every 6 hours after meals'),
(2, 2, 1, 'Single injection administered by nurse'),
(3, 3, 1, 'Apply cream to affected area for 7 days');
