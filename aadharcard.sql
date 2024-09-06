CREATE DATABASE IF NOT EXISTS aadhaar_enrolment;
USE aadhaar_enrolment;
CREATE TABLE Enrolment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    enrolment_type ENUM('New Enrolment', 'Update') NOT NULL,
    resident_status ENUM('Resident Indian', 'Non-Resident Indian') NOT NULL,
    aadhaar_number VARCHAR(12) UNIQUE,
    update_type SET('Biometric Update', 'Mobile', 'Date of Birth', 'Address', 'Name', 'Gender', 'Email', 'Document update', 'Language only Update'),
    name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Transgender') NOT NULL,
    age INT,
    date_of_birth DATE,
    email VARCHAR(255),
    mobile VARCHAR(15),
    verification_type ENUM('Document Based', 'Head of Family (HoF) Based'),
    document_poi VARCHAR(255),
    document_poa VARCHAR(255),
    document_dob VARCHAR(255),
    hof_aadhaar VARCHAR(12),
    hof_name VARCHAR(100),
    hof_relationship ENUM('Father', 'Mother', 'Guardian', 'Husband', 'Wife', 'Others'),
    address_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (address_id) REFERENCES Address(address_id)
);
CREATE TABLE Address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
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
    pin_code VARCHAR(6) NOT NULL
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


INSERT INTO Enrolment (enrolment_type, resident_status, aadhaar_number, update_type, name, gender, age, date_of_birth, email, mobile, verification_type, document_poi, document_poa, document_dob, hof_aadhaar, hof_name, hof_relationship, address_id)
VALUES 
('New Enrolment', 'Resident Indian', '123456789012', 'Biometric Update,Mobile', 'Rohit Kumar', 'Male', 25, '1999-01-15', 'rohit@example.com', '9876543210', 'Document Based', 'Passport', 'Electricity Bill', 'Birth Certificate', NULL, NULL, NULL, 1),
('Update', 'Non-Resident Indian', '987654321012', 'Address,Name', 'Anita Sharma', 'Female', 32, '1992-07-10', 'anita@example.com', '9123456789', 'Head of Family (HoF) Based', 'PAN Card', 'Gas Bill', 'School Certificate', '123456789012', 'Rohit Kumar', 'Brother', 2);
INSERT INTO Address (address_c_o, house_no, street, landmark, ward_no, area, village_city, post_office, district, sub_district, state, pin_code)
VALUES 
('Mr. Kumar', '123', 'Main Street', 'Near Park', '12', 'Sector 22', 'Delhi', 'Karol Bagh', 'Central Delhi', 'New Delhi', 'Delhi', '110005'),
('Mrs. Sharma', '456', 'MG Road', 'Opposite Mall', '9', 'Downtown', 'Mumbai', 'Andheri', 'Mumbai Suburban', 'Mumbai', 'Maharashtra', '400053');
INSERT INTO document_update (enrolment_id, document_type, document_name)
VALUES 
(1, 'POI', 'Passport'),
(2, 'POA', 'Electricity Bill');
INSERT INTO biometric_update (enrolment_id, photo, fingerprint, iris_scan)
VALUES 
(1, NULL, NULL, NULL),
(2, NULL, NULL, NULL);
INSERT INTO hof_details (enrolment_id, hof_aadhaar, hof_name, relationship)
VALUES 
(2, '123456789012', 'Rohit Kumar', 'Brother');
