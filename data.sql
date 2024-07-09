INSERT INTO
    APARTMENT_COMPLEX (COMPLEX_NAME, NUM_OF_BLOCKS, ADDRESS)
VALUES
    ('Complex1', 5, '123 Main St'),
    ('Complex2', 8, '456 Oak St'),
    ('Complex3', 10, '789 Pine St');

INSERT INTO
    BLOCK (BLOCK_NO, NUM_OF_FLOORS, COMPLEX_ID)
VALUES
    (1, 10, 1),
    (2, 8, 2),
    (3, 7, 1),
    (4, 12, 3),
    (5, 5, 2);

INSERT INTO
    EMPLOYEE (
        EMP_ID,
        COMPLEX_ID,
        FIRST_NAME,
        LAST_NAME,
        EMAIL,
        TEL_NO,
        POSITION,
        EDU_LEVEL,
        SALARY
    )
VALUES
    (
        1,
        1,
        'John',
        'Doe',
        'john.doe1@example.com',
        '0911234561',
        'Manager',
        'Bachelor',
        5000
    ),
    (
        2,
        1,
        'Jane',
        'Doe',
        'jane.doe2@example.com',
        '0911234562',
        'Supervisor',
        'Master',
        6000
    ),
    (
        3,
        3,
        'Jim',
        'Beam',
        'jim.beam3@example.com',
        '0911234563',
        'Technician',
        'Diploma',
        4000
    ),
    (
        4,
        2,
        'Jack',
        'Daniels',
        'jack.daniels4@example.com',
        '0911234564',
        'Cleaner',
        'HighSchool',
        3000
    ),
    (
        5,
        3,
        'Johnny',
        'Walker',
        'johnny.walker5@example.com',
        '0911234565',
        'Security',
        'HighSchool',
        3500
    ),
    (
        6,
        2,
        'James',
        'Smith',
        'james.smith6@example.com',
        '0911234566',
        'Manager',
        'Bachelor',
        5000
    ),
    (
        7,
        1,
        'Robert',
        'Brown',
        'robert.brown7@example.com',
        '0911234567',
        'Supervisor',
        'Master',
        6000
    ),
    (
        8,
        3,
        'Michael',
        'Johnson',
        'michael.johnson8@example.com',
        '0911234568',
        'Technician',
        'Diploma',
        4000
    ),
    (
        9,
        1,
        'William',
        'Jones',
        'william.jones9@example.com',
        '0911234569',
        'Cleaner',
        'HighSchool',
        3000
    ),
    (
        10,
        2,
        'David',
        'Garcia',
        'david.garcia10@example.com',
        '0911234570',
        'Security',
        'HighSchool',
        3500
    );

INSERT INTO
    OWNER (OWNER_ID, FIRST_NAME, LAST_NAME, EMAIL, TEL_NO)
VALUES
    (
        2,
        'Alice',
        'Smith',
        'alice.smith@example.com',
        '0912234561'
    ),
    (
        3,
        'Bob',
        'Johnson',
        'bob.johnson@example.com',
        '0912234562'
    ),
    (
        4,
        'Charlie',
        'Williams',
        'charlie.williams@example.com',
        '0912234563'
    );

-- Generate 40 random entries for the HOUSE table
INSERT INTO
    HOUSE (
        OWNER_ID,
        BLOCK_ID,
        HOUSE_ID,
        HOUSE_NO,
        LISTING_TYPE,
        NUM_OF_BEDROOM,
        FLOOR_NO,
        IS_FURNISHED,
        IS_AVAILABLE
    )
SELECT
    FLOOR(RAND() * 4) + 1 AS OWNER_ID,
    -- Random owner ID between 1 and 4
    FLOOR(RAND() * 3) + 1 AS BLOCK_ID,
    -- Random block ID between 1 and 5
    ROW_NUMBER() OVER (
        ORDER BY
            RAND()
    ) AS HOUSE_ID,
    -- House ID starts from 11 and increments
    FLOOR(RAND() * 1000) + 1 AS HOUSE_NO,
    -- Random house number between 1 and 1000
    CASE
        WHEN RAND() < 0.5 THEN 'R' -- 50% chance for 'R' listing type
        ELSE 'S' -- 50% chance for 'S' listing type
    END AS LISTING_TYPE,
    CONCAT(FLOOR(RAND() * 3) + 1, '') AS NUM_OF_BEDROOM,
    -- Random number of bedrooms between 1 and 3
    FLOOR(RAND() * 5) + 3 AS FLOOR_NO,
    -- Random floor number between 3 and 7
    CASE
        WHEN RAND() < 0.5 THEN TRUE -- 50% chance for true (furnished)
        ELSE FALSE -- 50% chance for false (not furnished)
    END AS IS_FURNISHED,
    TRUE AS IS_AVAILABLE -- All houses are available initially
FROM
    information_schema.tables AS t1,
    information_schema.tables AS t2
LIMIT
    50;

-- Limit the number of inserted rows to 50


INSERT INTO TENANT (TENANT_ID, HOUSE_ID, FIRST_NAME, LAST_NAME, EMAIL, TEL_NO) VALUES 
(1, 1, 'Olivia', 'Smith', 'olivia.smith@example.com', '0913234561'),
(2, 2, 'Liam', 'Johnson', 'liam.johnson@example.com', '0913234562'),
(3, 3, 'Emma', 'Williams', 'emma.williams@example.com', '0913234563'),
(4, 4, 'Noah', 'Jones', 'noah.jones@example.com', '0913234564'),
(5, 5, 'Ava', 'Brown', 'ava.brown@example.com', '0913234565'),
(6, 6, 'Elijah', 'Garcia', 'elijah.garcia@example.com', '0913234566'),
(7, 7, 'Sophia', 'Martinez', 'sophia.martinez@example.com', '0913234567'),
(8, 8, 'William', 'Davis', 'william.davis@example.com', '0913234568'),
(9, 9, 'Isabella', 'Rodriguez', 'isabella.rodriguez@example.com', '0913234569'),
(10, 10, 'James', 'Martinez', 'james.martinez@example.com', '0913234570');

INSERT INTO CONTRACT (TENANT_ID, CONTRACT_NO, OWNER_ID, HOUSE_ID, CONTRACT_TYPE, ADVANCE_DEPOSIT, PAYMENT_SCHEME, DEPOSIT, START_DATE, FINISH_DATE, LATE_FEE, TOTAL_AMOUNT) VALUES 
(1, 1000000001, 1, 1, 'R', 1000, 'Monthly', 500, '2023-01-01', '2024-01-01', 50, 12000),
(2, 1000000002, 2, 2, 'S', 2000, 'Yearly', 1000, '2023-02-01', '2024-02-01', 100, 24000),
(3, 1000000003, 3, 3, 'R', 1500, 'Monthly', 750, '2023-03-01', '2024-03-01', 75, 18000),
(4, 1000000004, 1, 4, 'S', 2500, 'Yearly', 1250, '2023-04-01', '2024-04-01', 125, 30000),
(5, 1000000005, 1, 5, 'R', 1200, 'Monthly', 600, '2023-05-01', '2024-05-01', 60, 14400),
(6, 1000000006, 1, 6, 'S', 2200, 'Yearly', 1100, '2023-06-01', '2024-06-01', 110, 26400),
(7, 1000000007, 1, 7, 'R', 1300, 'Monthly', 650, '2023-07-01', '2024-07-01', 65, 15600),
(8, 1000000008, 1, 8, 'S', 2300, 'Yearly', 1150, '2023-08-01', '2024-08-01', 115, 27600),
(9, 1000000009, 2, 9, 'R', 1400, 'Monthly', 700, '2023-09-01', '2024-09-01', 70, 16800),
(10, 1000000010,1, 10, 'S', 2400, 'Yearly', 1200, '2023-10-01', '2024-10-01', 120, 28800);

INSERT INTO HOUSE_PAYMENTS (CONTRACT_NO, BILL_NO, TENANT_ID, OWNER_ID, PAYMENT_TYPE, ISSUANCE_DATE, AMOUNT, DEADLINE, LATE_FEE, IS_PAID) VALUES 
(1000000001, 2000000001, 1, 1, 'M', '2023-01-10', 1000, '2023-02-10', 50, 0),
(1000000002, 2000000002, 2, 2, 'Y', '2023-02-15', 2000, '2023-03-15', 100, 0),
(1000000003, 2000000003, 3, 3, 'M', '2023-03-20', 1500, '2023-04-20', 75, 0),
(1000000004, 2000000004, 4, 1, 'Y', '2023-04-25', 2500, '2023-05-25', 125, 0),
(1000000005, 2000000005, 5, 1, 'M', '2023-05-30', 1200, '2023-06-30', 60, 0),
(1000000006, 2000000006, 6, 2, 'Y', '2023-06-05', 2200, '2023-07-05', 110, 0),
(1000000007, 2000000007, 7, 3, 'M', '2023-07-10', 1300, '2023-08-10', 65, 0),
(1000000008, 2000000008, 8, 2, 'Y', '2023-08-15', 2300, '2023-09-15', 115, 0),
(1000000009, 2000000009, 9, 1, 'M', '2023-09-20', 1400, '2023-10-20', 70, 0),
(1000000010, 2000000010, 10, 2, 'Y', '2023-10-25', 2400, '2023-11-25', 120, 0);

INSERT INTO RECIEPT (BILL_NO, TENANT_ID, PAYMENT_DATE, PAID_AMOUNT, LATE_FEE) VALUES 
(2000000001, 1, '2023-01-11', 1000, 50),
(2000000002, 2, '2023-02-16', 2000, 100),
(2000000003, 3, '2023-03-21', 1500, 75),
(2000000004, 4, '2023-04-26', 2500, 125),
(2000000005, 5, '2023-05-31', 1200, 60),
(2000000006, 6, '2023-06-06', 2200, 110),
(2000000007, 7, '2023-07-11', 1300, 65),
(2000000008, 8, '2023-08-16', 2300, 115),
(2000000009, 9, '2023-09-21', 1400, 70),
(2000000010, 10, '2023-10-26', 2400, 120);

INSERT INTO UTILITIES (UTILITY_NAME, PAYMENT_SCHEME) VALUES 
('Water', 'Monthly'),
('Electricity', 'Monthly'),
('Gas', 'Monthly'),
('Internet', 'Monthly'),
('Trash', 'Monthly'),
('Security', 'Monthly'),
('Maintenance', 'Monthly'),
('Parking', 'Monthly'),
('Cable TV', 'Monthly'),
('Cleaning', 'Monthly');

INSERT INTO UTILITY_BILL (TENANT_ID, BILL_NO, BILL_DATE, HOUSE_ID, UTILITY_NAME, BILL_AMOUNT, BILL_DEADLINE, LATE_FEE) VALUES 
(1, 3000000001, '2023-01-05', 1, 'Water', 50.00, '2023-02-05', 5),
(1, 3000000002, '2023-02-10', 1, 'Electricity', 75.00, '2023-03-10', 10),
(3, 3000000003, '2023-03-15', 3, 'Gas', 100.00, '2023-04-15', 15),
(2, 3000000004, '2023-04-20', 2, 'Internet', 25.00, '2023-05-20', 2),
(5, 3000000005, '2023-05-25', 5, 'Trash', 30.00, '2023-06-25', 3),
(3, 3000000006, '2023-06-30', 3, 'Security', 40.00, '2023-07-30', 4),
(3, 3000000007, '2023-07-05', 3, 'Maintenance', 60.00, '2023-08-05', 6),
(2, 3000000008, '2023-08-10', 2, 'Parking', 80.00, '2023-09-10', 8),
(2, 3000000009, '2023-09-15', 2, 'Cable TV', 45.00, '2023-10-15', 5),
(1, 3000000010, '2023-10-20', 1, 'Cleaning', 55.00, '2023-11-20', 6);

INSERT INTO FACILITIES (FACILITY_ID, BLOCK_ID, FACILITY_NAME, FACILITY_STATUS, LAST_UPDATE) VALUES 
(1, 1, 'Gym', 'Open', '2023-01-01'),
(2, 2, 'Pool', 'Closed', '2023-02-01'),
(3, 3, 'Sauna', 'Open', '2023-03-01'),
(4, 2, 'Lounge', 'Closed', '2023-04-01'),
(5, 3, 'Garden', 'Open', '2023-05-01'),
(6, 2, 'Playground', 'Closed', '2023-06-01'),
(7, 1, 'Laundry', 'Open', '2023-07-01'),
(8, 2, 'Parking', 'Closed', '2023-08-01'),
(9, 3, 'Security', 'Open', '2023-09-01'),
(10, 1, 'Maintenance', 'Closed', '2023-10-01');


INSERT INTO INSPECTION (FACILITY_ID, INS_ID, EMP_ID, INS_DATE, INS_TIME, FACILITY_STATUS, NOTES) VALUES 
(2, 1000, 1, '2023-01-10', '09:00:00', 'Open', 'Inspection completed'),
(3, 1001, 2, '2023-02-15', '12:00:00', 'Closed', 'Routine check'),
(4, 1002, 3, '2023-03-20', '15:00:00', 'Open', 'Maintenance required'),
(6, 1003, 2, '2023-04-25', '09:00:00', 'Closed', 'Repair needed'),
(2, 1004, 3, '2023-05-30', '12:00:00', 'Open', 'Good condition'),
(4, 1005, 5, '2023-06-05', '15:00:00', 'Closed', 'Inspection completed'),
(3, 1006, 2, '2023-07-10', '09:00:00', 'Open', 'Routine check'),
(1, 1007, 5, '2023-08-15', '12:00:00', 'Closed', 'Maintenance required'),
(3, 1008, 2, '2023-09-20', '15:00:00', 'Open', 'Repair needed'),
(3, 1009, 6, '2023-10-25', '09:00:00', 'Closed', 'Good condition');

INSERT INTO CAMERA (CAM_ID, BLOCK_ID, FLOOR_NO, FEED_LINK, STATUS) VALUES
(1, 1, 1, 'http://feed1.example.com', 'Active'),
(2, 1, 2, 'http://feed2.example.com', 'Inactive'),
(3, 1, 3, 'http://feed3.example.com', 'Active'),
(4, 2, 3, 'http://feed4.example.com', 'Inactive'),
(5, 2, 5, 'http://feed5.example.com', 'Active'),
(6, 3, 3, 'http://feed6.example.com', 'Inactive'),
(7, 2, 3, 'http://feed7.example.com', 'Active'),
(8, 3, 2, 'http://feed8.example.com', 'Inactive'),
(9, 2, 2, 'http://feed9.example.com', 'Active'),
(10, 2, 1, 'http://feed10.example.com', 'Inactive');


INSERT INTO PARKING_SLOT (SLOT_ID, HOUSE_ID, IS_AVAILABLE) VALUES
(1, 1, TRUE),
(2, 2, FALSE),
(3, 3, TRUE),
(4, 4, FALSE),
(5, 5, TRUE),
(6, 6, FALSE),
(7, 7, TRUE),
(8, 8, FALSE),
(9, 9, TRUE),
(10, 10, FALSE);

INSERT INTO COMMON_AREA (CA_NAME, BLOCK_ID, IS_AVAILABLE) VALUES
('Gym', 1, TRUE),
('Pool', 2, FALSE),
('Sauna', 3, TRUE),
('Lounge', 1, FALSE),
('Garden', 1, TRUE),
('Playground', 2, FALSE),
('Laundry', 2, TRUE),
('Parking', 1, FALSE),
('Security', 2, TRUE),
('Maintenance', 3, FALSE);

INSERT INTO MANAGEMENT_COMMITEE (BLOCK_ID, MANAGER_ID, NUM_OF_MEMBERS) VALUES
(1, 101, 5),
(2, 102, 6),
(3, 103, 7);

INSERT INTO COMMITTEE_MEMBER (MEMBER_ID, BLOCK_ID, HOUSE_ID, ROLE, WAS_MEMBER) VALUES
(1, 1, 1, 'President', TRUE),
(2, 1, 2, 'Vice President', FALSE),
(3, 1, 3, 'Secretary', TRUE),
(4, 1, 4, 'Treasurer', FALSE),
(5, 2, 5, 'Member', TRUE),
(6, 1, 6, 'Member', FALSE),
(7, 1, 7, 'Member', TRUE),
(8, 2, 8, 'Member', FALSE),
(9, 2, 9, 'Member', TRUE),
(10, 2, 10, 'Member', FALSE);


INSERT INTO BOOKING (BOOKING_ID, TENANT_ID, CA_NAME, HOUSE_ID, REASON, START_TIME, END_TIME, START_DATE, END_DATE) VALUES
(1, 1, 'Gym', 1, 'Workout', '07:00:00', '08:00:00', '2023-01-01', '2023-01-01'),
(2, 1, 'Pool', 2, 'Swimming', '09:00:00', '10:00:00', '2023-02-01', '2023-02-01'),
(3, 2, 'Sauna', 3, 'Relaxation', '11:00:00', '12:00:00', '2023-03-01', '2023-03-01'),
(4, 3, 'Lounge', 4, 'Meeting', '13:00:00', '14:00:00', '2023-04-01', '2023-04-01'),
(5, 3, 'Garden', 5, 'Picnic', '15:00:00', '16:00:00', '2023-05-01', '2023-05-01'),
(6, 2, 'Playground', 6, 'Playdate', '17:00:00', '18:00:00', '2023-06-01', '2023-06-01'),
(7, 2, 'Laundry', 7, 'Laundry', '19:00:00', '20:00:00', '2023-07-01', '2023-07-01'),
(8, 1, 'Parking', 8, 'Parking', '21:00:00', '22:00:00', '2023-08-01', '2023-08-01'),
(9, 4, 'Security', 9, 'Meeting', '23:00:00', '00:00:00', '2023-09-01', '2023-09-01'),
(10, 5, 'Maintenance', 10, 'Repair', '01:00:00', '02:00:00', '2023-10-01', '2023-10-01');


INSERT INTO BOOKING_STATUS (BOOKING_ID, MEMBER_ID, BOOKING_STATUS, UPDATE_DATE) VALUES
(1, 1, 'Confirmed', '2023-01-02'),
(2, 2, 'Pending', '2023-02-02'),
(3, 3, 'Cancelled', '2023-03-02'),
(4, 4, 'Confirmed', '2023-04-02'),
(5, 5, 'Pending', '2023-05-02'),
(6, 6, 'Cancelled', '2023-06-02'),
(7, 7, 'Confirmed', '2023-07-02'),
(8, 8, 'Pending', '2023-08-02'),
(9, 9, 'Cancelled', '2023-09-02'),
(10, 10, 'Confirmed', '2023-10-02');

