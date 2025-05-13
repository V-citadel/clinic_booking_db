# Clinic Booking System

## Project Overview

This project is a complete database management system built using MySQL. It is designed to manage a clinic’s operations, including the storage and retrieval of information related to patients, doctors, appointments, medical records, and prescriptions. The system implements proper database normalization, constraints, and relationships to ensure data integrity and consistency.

The project was developed as part of an academic exercise to demonstrate the ability to design and implement a full-featured relational database system for a real-world use case using Structured Query Language (SQL) only.

## Features Implemented

1. **Patient Management**  
   The system stores and manages personal details of all patients including their full names, date of birth, gender, phone number, and email address. Each patient is assigned a unique identifier.

2. **Doctor Management**  
   Doctors are registered in the system with their names, contact details, and area of medical specialty. Each doctor is linked to a specific specialty through a foreign key relationship.

3. **Specialties Table**  
   A separate table is used to manage and categorize different medical specialties. This ensures that the doctor-specialty relationship is normalized and scalable.

4. **Appointment Scheduling**  
   Patients can be assigned appointments with doctors. Each appointment captures the date, time, and reason for the visit. A unique constraint ensures that a patient cannot have multiple appointments with the same doctor at the same time.

5. **Medical Records Management**  
   Each appointment can be associated with a medical record. Medical records include symptoms, diagnosis, and optional notes recorded during the visit.

6. **Prescription Handling**  
   A medical record may have one associated prescription. The system stores details such as medication name, dosage, and instructions.

7. **Relational Integrity**  
   The database design includes appropriate use of primary keys, foreign keys, NOT NULL constraints, and UNIQUE constraints to enforce data accuracy and relationships among entities.

## Database Structure

The database includes the following tables:

- `specialties`: Stores different areas of medical specialization.
- `doctors`: Stores personal details of doctors and links to their respective specialties.
- `patients`: Stores patient information.
- `appointments`: Stores appointment data linking patients to doctors.
- `medical_records`: Stores clinical records tied to appointments.
- `prescriptions`: Stores medication instructions tied to medical records.

The relationships include:

- One-to-Many between `specialties` and `doctors`
- One-to-Many between `patients` and `appointments`
- One-to-Many between `doctors` and `appointments`
- One-to-One between `appointments` and `medical_records`
- One-to-One between `medical_records` and `prescriptions`

## How to Set Up the Database

1. Ensure you have MySQL installed and running on your computer.
2. Open your MySQL client (e.g., MySQL Workbench, phpMyAdmin, or the MySQL command-line interface).
3. Import the SQL file included in this project. This file contains all the necessary `CREATE TABLE` statements, constraints, and sample data.

   Example command using MySQL CLI:
linic_booking_db

4. Once imported, you will have access to a fully functional relational database that you can query, modify, or extend as needed.

## Entity Relationship Diagram (ERD)

An ER diagram file is included with this project to visually represent the relationships between the tables. The diagram illustrates the one-to-many and one-to-one relationships, as well as the key constraints used to enforce data integrity.

- The ERD is saved in `.dbml` format and can be opened at https://dbdiagram.io by copying and pasting its contents into the editor.
- A screenshot or image file of the diagram (`clinic_booking_erd.png`) may also be included in this repository for easy reference.

## Files Included

- `clinic_booking.sql`: Contains all SQL statements for creating the database schema and inserting sample data.
- `clinic_booking_db_diagram.dbml`: The ER diagram definition file that can be imported into dbdiagram.io.
- `clinic_booking_erd.png`: (Optional) A static image version of the ER diagram for offline viewing.

## Author

This project was created by Vincent Karanja Wanjiku from Nakuru, Kenya.
