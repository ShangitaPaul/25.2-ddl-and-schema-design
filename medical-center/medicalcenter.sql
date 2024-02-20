/**
Medical Center Schema Design
* Table: Doctors
Columns: doctor_id (Primary Key), name, specialization

Table: Patients
Columns: patient_id (Primary Key), name, date_of_birth

Table: Visits
Columns: visit_id (Primary Key), doctor_id (Foreign Key), patient_id (Foreign Key), visit_date, diagnosis
*/

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100)
);

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE
);
CREATE TABLE Visits (
    visit_id INT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    visit_date DATE,
    diagnosis VARCHAR(100),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
```