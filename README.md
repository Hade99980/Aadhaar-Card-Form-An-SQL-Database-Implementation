

1. **`id INT AUTO_INCREMENT PRIMARY KEY`**: 
   - **Data Type**: `INT`
   - **Purpose**: This is the primary key of the table, uniquely identifying each row. The `AUTO_INCREMENT` property ensures that this value automatically increases with each new entry.

2. **`enrolment_type ENUM('New Enrolment', 'Update') NOT NULL`**:
   - **Data Type**: `ENUM`
   - **Purpose**: Used to specify the type of enrolment, with a limited set of allowed values (`New Enrolment`, `Update`). The `NOT NULL` constraint ensures that a value must always be provided.

3. **`resident_status ENUM('Resident Indian', 'Non-Resident Indian') NOT NULL`**:
   - **Data Type**: `ENUM`
   - **Purpose**: Indicates the residency status of the individual, limited to `Resident Indian` or `Non-Resident Indian`.

4. **`aadhaar_number VARCHAR(12) UNIQUE`**:
   - **Data Type**: `VARCHAR(12)`
   - **Purpose**: Stores the Aadhaar number, which is a 12-digit unique identification number issued by the Indian government. The `UNIQUE` constraint ensures that no two rows can have the same Aadhaar number.

5. **`update_type SET('Biometric Update', 'Mobile', ...)`**:
   - **Data Type**: `SET`
   - **Purpose**: A set of values indicating the type(s) of update(s) requested. The `SET` data type allows the selection of one or more of the listed values.

6. **`name VARCHAR(100) NOT NULL`**:
   - **Data Type**: `VARCHAR(100)`
   - **Purpose**: Stores the individual's full name, with a maximum length of 100 characters.

7. **`gender ENUM('Male', 'Female', 'Transgender') NOT NULL`**:
   - **Data Type**: `ENUM`
   - **Purpose**: Specifies the gender of the individual.

8. **`age INT`**:
   - **Data Type**: `INT`
   - **Purpose**: Stores the individual's age as an integer value.

9. **`date_of_birth DATE`**:
   - **Data Type**: `DATE`
   - **Purpose**: Stores the individual's date of birth.

10. **Address Fields (`address_c_o`, `house_no`, `street`, `landmark`, etc.)**:
    - **Data Types**: Primarily `VARCHAR` with varying lengths (e.g., `VARCHAR(255)`, `VARCHAR(100)`).
    - **Purpose**: Stores various components of the individual's address, such as the house number, street, and city.

11. **`email VARCHAR(255)`**:
    - **Data Type**: `VARCHAR(255)`
    - **Purpose**: Stores the individual's email address.

12. **`mobile VARCHAR(15)`**:
    - **Data Type**: `VARCHAR(15)`
    - **Purpose**: Stores the individual's mobile number, allowing for international numbers if needed.

13. **`pin_code VARCHAR(6) NOT NULL`**:
    - **Data Type**: `VARCHAR(6)`
    - **Purpose**: Stores the postal PIN code, typically 6 digits long in India.

14. **`verification_type ENUM('Document Based', 'Head of Family (HoF) Based')`**:
    - **Data Type**: `ENUM`
    - **Purpose**: Indicates the type of verification method used.

15. **Document Fields (`document_poi`, `document_poa`, `document_dob`)**:
    - **Data Types**: `VARCHAR(255)`
    - **Purpose**: Stores the names or details of the documents provided for proof of identity, address, and date of birth.

16. **`hof_aadhaar VARCHAR(12)`**:
    - **Data Type**: `VARCHAR(12)`
    - **Purpose**: Stores the Aadhaar number of the Head of Family, if applicable.

17. **`hof_name VARCHAR(100)`**:
    - **Data Type**: `VARCHAR(100)`
    - **Purpose**: Stores the name of the Head of Family.

18. **`hof_relationship ENUM('Father', 'Mother', ...)`**:
    - **Data Type**: `ENUM`
    - **Purpose**: Indicates the relationship of the enrollee to the Head of Family.

19. **`created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP`**:
    - **Data Type**: `TIMESTAMP`
    - **Purpose**: Automatically stores the timestamp when the record is created.

20. **`updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP`**:
    - **Data Type**: `TIMESTAMP`
    - **Purpose**: Automatically updates the timestamp whenever the record is modified.

