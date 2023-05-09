CREATE TABLE patients (id INT GENERATED ALWAYS AS IDENTITY, name varchar(100), date_of_birth DATE, PRIMARY KEY(id));

CREATE TABLE medical_histories (id INT GENERATED ALWAYS AS IDENTITY, admitted_at TIMESTAMP, patient_id INT, status varchar(250), PRIMARY KEY(id), CONSTRAINT fk_patient FOREIGN KEY(patient_id) REFERENCES patients(id));
