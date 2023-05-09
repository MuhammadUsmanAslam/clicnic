CREATE TABLE patients (id INT GENERATED ALWAYS AS IDENTITY, name varchar(100), date_of_birth DATE, PRIMARY KEY(id));

CREATE TABLE medical_histories (id INT GENERATED ALWAYS AS IDENTITY, admitted_at TIMESTAMP, patient_id INT, status varchar(250), PRIMARY KEY(id), CONSTRAINT fk_patient FOREIGN KEY(patient_id) REFERENCES patients(id));
CREATE TABLE treatments (id INT GENERATED ALWAYS AS IDENTITY, type VARCHAR(250), name VARCHAR(250), PRIMARY KEY(id));

/* Many-to-Many relationship between trearments and medical-histories  */
CREATE TABLE treatment_histories (medical_history_id INT,treatment_id INT,PRIMARY KEY (medical_history_id, treatment_id), CONSTRAINT fk_medical_histoy FOREIGN KEY(medical_histoy_id) REFERENCES medical_histories(id), CONSTRAINT fk_treatment FOREIGN KEY(treatment_id) REFERENCES treatments(id));

CREATE TABLE invoices (id INT GENERATED ALWAYS AS IDENTITY,total_amount NUMERIC(5,2),generated_at TIMESTAMP,payed_at TIMESTAMP,medical_histoy__id INT DEFAULT 0,PRIMARY KEY(id),UNIQUE(medical_histoy__id),CONSTRAINT fk_medical_histoy FOREIGN KEY(medical_histoy__id) REFERENCES medical_histories(id));

CREATE TABLE invoice_items (id INT GENERATED ALWAYS AS IDENTITY, unit_price NUMERIC(5,2), quantity INT, total_price NUMERIC(5, 2), invoice_id INT, treatment_id INT, PRIMARY KEY(id), CONSTRAINT fk_invoice FOREIGN KEY(invoice_id) REFERENCES invoices(id), CONSTRAINT fk_treatment FOREIGN KEY(treatment_id) REFERENCES treatments(id));

-- Indexes
CREATE INDEX patient_id_asc ON medical_histories(patient_id ASC);
CREATE INDEX invoice_id_asc ON invoice_items(invoice_id ASC);
CREATE INDEX treatment_id_asc ON invoice_items(treatment_id ASC);
CREATE INDEX medical_history_id_asc ON invoices(medical_history_id ASC);

CREATE INDEX treatment_histories_medical_history_id_asc ON treatment_histories(medical_history_id ASC);
CREATE INDEX treatment_histories_medical_history_id_asc ON treatment_histories(treatment_id ASC);