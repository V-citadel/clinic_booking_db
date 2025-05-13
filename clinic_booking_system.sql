
-- Drop tables if they already exist
DROP TABLE IF EXISTS prescriptions, medical_records, appointments, patients, doctors, specialties;

-- Specialties Table
CREATE TABLE specialties (
    specialty_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Doctors Table
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    specialty_id INT,
    FOREIGN KEY (specialty_id) REFERENCES specialties(specialty_id)
);

-- Patients Table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Appointments Table
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    UNIQUE (patient_id, doctor_id, appointment_date)
);

-- Medical Records Table
CREATE TABLE medical_records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT NOT NULL UNIQUE,
    symptoms TEXT NOT NULL,
    diagnosis TEXT NOT NULL,
    notes TEXT,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- Prescriptions Table
CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    record_id INT NOT NULL UNIQUE,
    medication_name VARCHAR(100) NOT NULL,
    dosage VARCHAR(50) NOT NULL,
    instructions TEXT,
    FOREIGN KEY (record_id) REFERENCES medical_records(record_id)
);

-- Sample Data Insertions

-- Insert Specialties
INSERT INTO specialties (name) VALUES
('Pediatrics'),
('Dermatology'),
('Cardiology'),
('General Surgery');

-- Insert Doctors (Kenyan Names)
INSERT INTO doctors (full_name, email, phone, specialty_id) VALUES
('Dr. Wanjiru Kibe', 'wanjiru.kibe@clinic.co.ke', '0711000001', 1),
('Dr. Otieno Obuya', 'otieno.obuya@clinic.co.ke', '0722000002', 2),
('Dr. Amina Hassan', 'amina.hassan@clinic.co.ke', '0733000003', 3);

-- Insert Patients (Kenyan Names)
INSERT INTO patients (full_name, date_of_birth, gender, phone, email) VALUES
('Brian Mwangi', '1992-08-15', 'Male', '0744000004', 'brian.mwangi@gmail.com'),
('Mary Atieno', '1987-05-30', 'Female', '0755000005', 'mary.atieno@gmail.com'),
('Josephine Njeri', '2000-01-20', 'Female', '0766000006', 'josephine.njeri@gmail.com');

-- Insert Appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date, reason) VALUES
(1, 1, '2025-05-15 08:00:00', 'High fever and joint pain'),
(2, 2, '2025-05-15 10:00:00', 'Skin rash and irritation'),
(3, 3, '2025-05-15 13:00:00', 'Shortness of breath');

-- Insert Medical Records
INSERT INTO medical_records (appointment_id, symptoms, diagnosis, notes) VALUES
(1, 'Fever, joint pain, fatigue', 'Dengue Fever', 'Patient advised to rest and hydrate.'),
(2, 'Itchy skin, red patches', 'Eczema', 'Use prescribed ointment twice daily.'),
(3, 'Difficulty breathing, chest pain', 'Asthma', 'Inhaler prescribed.');

-- Insert Prescriptions
INSERT INTO prescriptions (record_id, medication_name, dosage, instructions) VALUES
(1, 'Paracetamol', '1 tab every 6 hours', 'Take with food'),
(2, 'Betamethasone Cream', 'Apply twice daily', 'Avoid sunlight exposure on affected area'),
(3, 'Salbutamol Inhaler', '2 puffs when needed', 'Carry inhaler at all times');
