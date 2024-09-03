CREATE DATABASE IF NOT EXISTS aadhaar_enrolment;
USE aadhaar_enrolment;
CREATE TABLE enrolment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    enrolment_type ENUM('New Enrolment', 'Update') NOT NULL,
    resident_status ENUM('Resident Indian', 'Non-Resident Indian') NOT NULL,
    aadhaar_number VARCHAR(12) UNIQUE,
    update_type SET('Biometric Update', 'Mobile', 'Date of Birth', 'Address', 'Name', 'Gender', 'Email', 'Document update', 'Language only Update'),
    name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Transgender') NOT NULL,
    age INT,
    date_of_birth DATE,
    address_c_o VARCHAR(255),
    house_no VARCHAR(100),
    street VARCHAR(255),
    landmark VARCHAR(255),
    ward_no VARCHAR(50),
    area VARCHAR(255),
    village_city VARCHAR(255),
    post_office VARCHAR(255) NOT NULL,
    district VARCHAR(255),
    sub_district VARCHAR(255),
    state VARCHAR(255),
    email VARCHAR(255),
    mobile VARCHAR(15),
    pin_code VARCHAR(6) NOT NULL,
    verification_type ENUM('Document Based', 'Head of Family (HoF) Based'),
    document_poi VARCHAR(255),
    document_poa VARCHAR(255),
    document_dob VARCHAR(255),
    hof_aadhaar VARCHAR(12),
    hof_name VARCHAR(100),
    hof_relationship ENUM('Father', 'Mother', 'Guardian', 'Husband', 'Wife', 'Others'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE document_update (
    id INT AUTO_INCREMENT PRIMARY KEY,
    enrolment_id INT,
    document_type ENUM('POI', 'POA', 'DOB', 'POR') NOT NULL,
    document_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (enrolment_id) REFERENCES enrolment(id) ON DELETE CASCADE
);

CREATE TABLE biometric_update (
    id INT AUTO_INCREMENT PRIMARY KEY,
    enrolment_id INT,
    photo BLOB,
    fingerprint BLOB,
    iris_scan BLOB,
    FOREIGN KEY (enrolment_id) REFERENCES enrolment(id) ON DELETE CASCADE
);

CREATE TABLE hof_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    enrolment_id INT,
    hof_aadhaar VARCHAR(12) NOT NULL,
    hof_name VARCHAR(100) NOT NULL,
    relationship ENUM('Father', 'Mother', 'Guardian', 'Husband', 'Wife', 'Others') NOT NULL,
    FOREIGN KEY (enrolment_id) REFERENCES enrolment(id) ON DELETE CASCADE
);

SHOW TABLES LIKE 'enrolment';
INSERT INTO enrolment (enrolment_type, resident_status, aadhaar_number, update_type, name, gender, age, date_of_birth, address_c_o, house_no, street, landmark, ward_no, area, village_city, post_office, district, sub_district, state, email, mobile, pin_code, verification_type, document_poi, document_poa, document_dob, hof_aadhaar, hof_name, hof_relationship)
VALUES 
('New Enrolment', 'Resident Indian', '123456789012', NULL, 'Rahul Sharma', 'Male', 30, '1994-05-14', 'C/O Mohan Sharma', '101', 'MG Road', 'Near Park', '12', 'Sector 17', 'New Delhi', 'Connaught Place', 'New Delhi', 'New Delhi', 'Delhi', 'rahul.sharma@gmail.com', '9876543210', '110001', 'Document Based', 'Voter ID', 'Electricity Bill', 'Birth Certificate', NULL, NULL, NULL),
('Update', 'Resident Indian', '234567890123', 'Address', 'Sneha Gupta', 'Female', 28, '1996-03-25', 'C/O Anil Gupta', '202', 'Park Street', 'Opposite Mall', '21', 'Green Park', 'Bengaluru', 'Whitefield', 'Bengaluru', 'Bengaluru', 'Karnataka', 'sneha.gupta@example.com', '8765432109', '560066', 'Head of Family (HoF) Based', 'Passport', 'Rental Agreement', '10th Marksheet', '123456789012', 'Anil Gupta', 'Father'),
('New Enrolment', 'Non-Resident Indian', NULL, NULL, 'Amit Patel', 'Male', 35, '1989-08-20', 'C/O NRI Patel', '15A', 'Lakeview', 'Near Hospital', '7', 'Downtown', 'San Francisco', 'CA', NULL, 'California', 'amit.patel@nri.com', '1234567890', '94123', 'Document Based', 'NRI Passport', 'Bank Statement', NULL, NULL, NULL, NULL);
INSERT INTO document_update (enrolment_id, document_type, document_name)
VALUES 
(2, 'POI', 'Passport'),
(2, 'POA', 'Rental Agreement'),
(2, 'DOB', '10th Marksheet');
 INSERT INTO biometric_update (enrolment_id, photo, fingerprint, iris_scan)
VALUES 
(1, LOAD_FILE('/path/to/photo1.jpg'), LOAD_FILE('/path/to/fingerprint1.bin'), LOAD_FILE('/path/to/iris_scan1.bin')),
(3, LOAD_FILE('/path/to/photo3.jpg'), LOAD_FILE('/path/to/fingerprint3.bin'), LOAD_FILE('/path/to/iris_scan3.bin'));
INSERT INTO hof_details (enrolment_id, hof_aadhaar, hof_name, relationship)
VALUES 
(2, '123456789012', 'Anil Gupta', 'Father');

