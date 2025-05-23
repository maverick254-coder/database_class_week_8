# Clinic Booking System

## Project Description

The Clinic Booking System is a relational database management system designed to handle the operations of a clinic. This system tracks doctors, patients, appointments, treatments, and prescriptions. It also manages different medical specialties, ensuring efficient booking and management of clinic-related data.

The database includes tables for:
- **Specialties**: Types of medical specialties available at the clinic.
- **Doctors**: Details of doctors including their specialties.
- **Patients**: Information about the patients, such as their personal details and contact information.
- **Appointments**: Records of appointments between doctors and patients.
- **Treatments**: Details about treatments and their associated costs.
- **Medications**: List of available medications.
- **Prescriptions**: Medications prescribed during treatments.

## How to Run/Setup the Project

1. **Prerequisites**:
   - Install MySQL or MariaDB on your local machine or use an online MySQL platform like [phpMyAdmin](https://www.phpmyadmin.net/).
   - Ensure you have access to a SQL client such as MySQL Workbench, phpMyAdmin, or any MySQL-compatible interface.

2. **Setting up the Database**:
   - Clone or download this repository.
   - Open your SQL client and create a new database:
     ```sql
     CREATE DATABASE ClinicDB;
     USE ClinicDB;
     ```
   - Run the `SQL` file provided in this repository (e.g., `clinic_booking_system.sql`) to create all necessary tables and insert sample data.
   - You can import the `clinic_booking_system.sql` file directly from your SQL client if you have the file locally.

3. **SQL Setup**:
   - Open the SQL file and execute the queries to create tables, set up foreign keys, and insert sample data.

4. **Accessing the Database**:
   - After importing the SQL file, you can start running queries to interact with the data, such as viewing patients' appointments, adding new doctors, or generating treatment reports.

## Link to ERD

You can view the ERD here: [View ERD](https://dbdiagram.io/d/clinicDB-681b196e5b2fc4582f8ee3f9) 



