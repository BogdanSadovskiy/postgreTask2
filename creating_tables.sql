
drop table if exists doctors_examinations ;
drop table if exists wards ;
drop table if exists donations ;
drop table if exists professors;
drop table if exists interns;

drop table if exists diseases;
drop table if exists departments ;
drop table if exists examinations ;
drop table if exists doctors ;
drop table if exists sponsors ;



create table if not exists diseases(
id serial primary key,
name varchar (100)
);
CREATE TABLE IF NOT EXISTS departments (
    id SERIAL PRIMARY KEY,
    financing INT NOT NULL,
    building INT NOT NULL,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS examinations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS wards (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    places INT NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS doctors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    premium INT NOT NULL DEFAULT 0 CHECK (premium >= 0),
    salary INT NOT NULL CHECK (salary > 0)
);

CREATE TABLE IF NOT EXISTS sponsors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS doctors_examinations (
    id SERIAL PRIMARY KEY,
    doctor_id INT,
    FOREIGN KEY (doctor_id) REFERENCES doctors(id) ON DELETE CASCADE,
    examination_id INT,
    FOREIGN KEY (examination_id) REFERENCES examinations(id) ON DELETE CASCADE,
     disease_id int,
     foreign key (disease_id) references diseases(id),
    ward_id INT,
    FOREIGN KEY (ward_id) REFERENCES wards(id) ON DELETE CASCADE,
    exam_date  date not null check (exam_date >= now())
);

CREATE TABLE IF NOT EXISTS donations (
    id SERIAL PRIMARY KEY,
    amount INT NOT NULL,
    date DATE CHECK (date < CURRENT_DATE),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE CASCADE,
    sponsor_id INT,
    FOREIGN KEY (sponsor_id) REFERENCES sponsors(id) ON DELETE CASCADE
);

CREATE table if NOT EXISTS professors(
id SERIAL primary key,
doctor_id int
);

CREATE table if NOT EXISTS interns(
id SERIAL primary key,
doctor_id int
);


INSERT INTO departments (building, financing, name) VALUES
(1,100000, 'Cardiology'),
(1,120000, 'Neurology'),
(2,90000, 'Orthopedics'),
(2, 150000,'Pediatrics'),
(3, 270000,'Oncology'),
(3, 152000, 'Dermatology'),
(4, 80000, 'Gastroenterology'),
(4, 60000, 'Hematology'),
(5, 176000, 'Urology'),
(6, 49000, 'Ophthalmology');


INSERT INTO examinations (name) VALUES
('MRI'),
('CT Scan'),
('Ultrasound'),
('X-Ray'),
('Blood Test'),
('EKG'),
('Endoscopy'),
('Colonoscopy'),
('Biopsy'),
('Physical Examination');


INSERT INTO wards (name, places, department_id) VALUES
('Ward 1', 20, 1),
('Ward 2', 15, 1),
('Ward 3', 25, 1),
('Ward 4', 18, 2),
('Ward 5', 22, 2),
('Ward 6', 30, 2),
('Ward 7', 20, 3),
('Ward 8', 25, 3),
('Ward 9', 15, 4),
('Ward 10', 20, 4),
('Ward 11', 17, 4),
('Ward 12', 15, 5),
('Ward 13', 13, 5),
('Ward 14', 10, 5),
('Ward 15', 16, 6),
('Ward 16', 18, 6),
('Ward 17', 19, 6),
('Ward 18', 22, 7),
('Ward 19', 18, 7),
('Ward 20', 20, 7),
('Ward 21', 15, 8),
('Ward 22', 17, 8),
('Ward 23', 19, 8),
('Ward 24', 15, 9),
('Ward 25', 20, 9),
('Ward 26', 17, 10),
('Ward 27', 15, 10),
('Ward 28', 13, 10);


INSERT INTO doctors (name, surname, premium, salary) VALUES
('John', 'Doe', 500, 6000),
('Jane', 'Smith', 600, 7000),
('Michael', 'Johnson', 700, 8000),
('Emily', 'Brown', 550, 6500),
('David', 'Wilson', 600, 7000),
('Jennifer', 'Taylor', 650, 7500),
('Christopher', 'Anderson', 550, 6500),
('Jessica', 'Thomas', 700, 8000),
('Daniel', 'Jackson', 600, 7000),
('Elizabeth', 'White', 550, 6500),
('Carl', 'Wolker' , 0, 1200),
('Tom' , 'Cruse' , 100, 1100),
('Jeremy' , 'Clarkson' , 50, 1300);

INSERT INTO professors (doctor_id) VALUES
(2),
(4),
(6);

insert into interns(doctor_id) VALUES
(11),
(12),
(13);

-- Insert data into sponsors table
INSERT INTO sponsors (name) VALUES
('XYZ Corporation'),
('ABC Foundation'),
('Community Health Services'),
('Smith Family Trust'),
('Johnson Enterprises');


INSERT INTO donations (amount, date, department_id, sponsor_id) VALUES
(1000, '2024-04-22', 1, 1),
(2000, '2024-04-22', 2, 2),
(1500, '2024-04-21', 3, 3),
(2500, '2024-04-20', 4, 4),
(1800, '2024-04-19', 5, 5),
(1200, '2024-04-18', 6, 1),
(3000, '2024-04-17', 7, 2),
(1750, '2024-04-16', 8, 3),
(2200, '2024-04-15', 9, 4),
(2800, '2024-04-14', 10, 4),
(900, '2024-04-18', 1, 1),
(300, '2024-04-17', 2, 2),
(175, '2024-04-16', 3, 3),
(220, '2024-04-15', 9, 4),
(280, '2024-04-14', 10, 4);

INSERT INTO diseases (name) VALUES
('Influenza'),
('Diabetes'),
('Hypertension'),
('Asthma'),
('Arthritis'),
('Alzheimer''s Disease'),
('Parkinson''s Disease'),
('Cancer'),
('Tuberculosis'),
('HIV/AIDS'),
('Hepatitis'),
('Malaria'),
('Dengue Fever'),
('Cholera'),
('Pneumonia'),
('Ebola Virus Disease'),
('Zika Virus'),
('Lyme Disease'),
('Sickle Cell Anemia'),
('Celiac Disease');

INSERT INTO doctors_examinations (doctor_id, examination_id, disease_id, ward_id, exam_date) VALUES
(1, 1, 1, 2, '2024-05-06'),
(2, 2, 2, 1, '2024-05-07'),
(3, 3, 4, 3, '2024-05-08'),
(4, 4, 5, 4, '2024-05-09'),
(5, 5, 6, 5, '2024-05-10'),
(6, 6, 7, 6, '2024-05-11'),
(7, 7, 8, 7, '2024-05-12'),
(8, 8, 9, 8, '2024-05-13'),
(9, 9, 10, 9, '2024-05-14'),
(10, 10, 11, 10, '2024-05-15'),
(11, 2, 1, 2, '2024-05-16'),
(12, 4, 5, 4, '2024-05-17'),
(13, 6, 7, 6, '2024-05-18');


