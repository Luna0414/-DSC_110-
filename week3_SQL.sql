-- Create a patients table
CREATE TABLE PATIENTS(
  patient_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  age INTEGER,
  gender TEXT,
  city TEXT
  );
  
  -- Insert sample data into Patients 
  INSERT INTO PATIENTS(patient_id,name,age,gender,city) VALUES
  (1, 'John Doe', 45, 'M', 'Boston'),
 (2, 'Jane Smith', 32, 'F', 'Cambridge'),
 (3, 'Mike Johnson', 58, 'M', 'Boston'),
 (4, 'Sarah Williams', 41, 'F', 'Somerville'),
 (5, 'David Brown', 29, 'M', 'Boston'),
 (6, 'Emily Davis', 67, 'F', 'Cambridge');

SELECT*FROM PATIENTS;

--Specific fields
SELECT patient_id, name 
from PATIENTS;

--Single summary stats
--How many rows are there?
select count(*) from patients;

--Now select records for only Female patients
select count(distinct gender) 
from Patients;

--Select specific values listed in the patients table
--Specific rows/records

--Now select age and city from patients
SELECT*from PATIENTS
where city = 'Boston';

SELECT*from PATIENTS
where age < 48;

SELECT avg(age) from PATIENTS;

--Summarazing by another variable
select gender, avg(age)
from Patients
group by gender;

--sort/order by
select gender, avg(age)
from Patients
group by gender
order by 2 desc;

-- Create a Visits table
CREATE TABLE Visits (
  visit_id INTEGER PRIMARY KEY,
  patient_id INTEGER,
  visit_date TEXT,
  diagnosis TEXT,
  cost REAL,
  FOREIGN KEY (patient_id) 
  REFERENCES Patients(patient_id)
);

-- Insert sample data into Visits
INSERT INTO Visits (visit_id, patient_id, visit_date, diagnosis, cost) VALUES
(101, 1, '2024-01-15', 'Hypertension', 150.00),
(102, 1, '2024-03-20', 'Diabetes', 200.00),
(103, 2, '2024-02-10', 'Flu', 100.00),
(104, 3, '2024-01-25', 'Hypertension', 150.00),
(105, 3, '2024-02-14', 'Back Pain', 180.00),
(106, 4, '2024-03-05', 'Diabetes', 200.00),
(108, 6, '2024-02-20', 'Arthritis', 220.00),
(109, 6, '2024-03-15', 'Hypertension', 150.00);

SELECT * from Visits;

--Change the p to a v to switch to the visits table 
SELECT 
    p.name,
    p.age,
    v.visit_date,
    v.diagnosis,
    v.cost
FROM Patients p
JOIN Visits v ON p.patient_id = v.patient_id;
