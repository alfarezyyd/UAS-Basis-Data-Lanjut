INSERT INTO faculties (name, email, telephone, establishment_date, description)
VALUES
('Faculty of Computer Science', 'comp_science@example.com', '123-456-7890',  '2000-05-10', 'Fostering innovation in computer science education and research'),
('Faculty of Business Administration', 'business@example.com', '987-654-3210',  '1995-09-22', 'Providing comprehensive business education and leadership skills'),
('Faculty of Economics', 'economics@example.com', '555-123-4567',  '1990-11-15', 'Exploring economic theories and policies for societal development'),
('Faculty of Arts and Humanities', 'arts_humanities@example.com', '111-222-3333', '1985-07-30', 'Celebrating creativity and cultural diversity in arts and humanities'),
('Faculty of Engineering', 'engineering@example.com', '999-888-7777',  '2005-03-18', 'Innovating engineering solutions for global challenges');

SELECT * FROM faculties;

INSERT INTO lecturers (nip, full_name, email, birth_date, expertise, telephone, position, faculty_name, work_experience, join_date, title, last_education)
VALUES
('123456789012345678', 'John Doe', 'john@example.com', '1985-05-15', 'Database Management', '123-456-7890', 'Senior Lecturer', 'Faculty of Computer Science', '10 years in database administration', '2010-08-20', 'Senior Lecturer', 'Master of Science in Computer Engineering'),
('234567890123456789', 'Jane Smith', 'jane@example.com', '1990-10-22', 'Marketing Strategies', '987-654-3210', 'Assistant Professor', 'Faculty of Business Administration', '5 years in marketing analysis', '2015-04-10', 'Assistant Professor', 'Bachelor of Business Administration'),
('345678901234567890', 'Alice Johnson', 'alice@example.com', '1988-03-08', 'Financial Analysis', '555-123-4567', 'Associate Professor', 'Faculty of Economics', '12 years in financial consulting', '2012-09-05', 'Associate Professor', 'Ph.D. in Economics'),
('456789012345678901', 'Michael Brown', 'michael@example.com', '1982-12-30', 'Human Resource Management', '111-222-3333', 'Professor', 'Faculty of Arts and Humanities', '15 years in HR leadership', '2008-06-14', 'Professor', 'Doctor of Philosophy in Human Resource Management'),
('567890123456789012', 'Emily Davis', 'emily@example.com', '1995-07-18', 'Graphic Design', '999-888-7777', 'Lecturer', 'Faculty of Engineering', '3 years in graphic design teaching', '2020-02-28', 'Lecturer', 'Bachelor of Fine Arts in Graphic Design');

INSERT INTO study_programs (name, manager, description)
VALUES
('Computer Science', '123456789012345678', 'Program focusing on computer science and technology'),
('Business Administration', '234567890123456789', 'Program focusing on business management and administration'),
('Economics', '345678901234567890', 'Program focusing on economic theories and policies'),
('Arts and Humanities', '456789012345678901', 'Program focusing on arts, culture, and humanities'),
('Mechanical Engineering', '567890123456789012', 'Program focusing on mechanical engineering principles');


INSERT INTO courses (code, study_program_name, name, sks, type, semester, prerequisite, description)
VALUES
('COURSE01', 'Computer Science', 'Database Systems', 3, 'Compulsory', 5, NULL, 'Introduction to database management systems'),
('COURSE02', 'Business Administration', 'Marketing Management', 3, 'Compulsory', 4, NULL, 'Strategies and techniques in marketing'),
('COURSE03', 'Economics', 'Financial Analysis', 3, 'Compulsory', 3, NULL,  'Fundamentals of financial analysis'),
('COURSE04', 'Arts and Humanities', 'Art History', 2, 'Elective', 4, NULL, 'Exploring the history of art and culture'),
('COURSE05', 'Mechanical Engineering', 'Mechanical Design', 4, 'Compulsory', 6, NULL, 'Principles of mechanical design and analysis');

INSERT INTO lecturers_courses (lecturer_nip, course_code)
VALUES
('123456789012345678', 'COURSE01'),
('234567890123456789', 'COURSE02'),
('345678901234567890', 'COURSE03'),
('456789012345678901', 'COURSE04'),
('567890123456789012', 'COURSE05');

INSERT INTO curricula (code, name, implementation_schedule, study_program, description, last_updated)
VALUES
('C0001', 'Curriculum 1', '2023-08-01', 'Computer Science', 'Description for Curriculum 1', '2023-08-20'),
('C0002', 'Curriculum 2', '2023-09-01', 'Business Administration', 'Description for Curriculum 2', '2023-09-10'),
('C0003', 'Curriculum 3', '2023-10-01', 'Economics', 'Description for Curriculum 3', '2023-10-05'),
('C0004', 'Curriculum 4', '2023-11-01', 'Arts and Humanities', 'Description for Curriculum 4', '2023-11-15'),
('C0005', 'Curriculum 5', '2023-12-01', 'Mechanical Engineering', 'Description for Curriculum 5', '2023-12-25');


INSERT INTO curricula_courses (curricula_code, course_code)
VALUES
('C0001', 'COURSE01'),
('C0001', 'COURSE02'),
('C0002', 'COURSE02'),
('C0002', 'COURSE03'),
('C0003', 'COURSE03');


INSERT INTO people (identity_card_number, email, name, birth_date, gender, telephone, religion, origin_country, citizenship, driving_license_number)
VALUES
('123456789012345678', 'john@example.com', 'John Doe', '1985-05-15', 'Male', '1234567890', 'Christian', 'USA', 'WNA', 'DL12345'),
('234567890123456789', 'jane@example.com', 'Jane Smith', '1990-10-22', 'Female', '9876543210', 'Muslim', 'UK', 'WNI', 'DL67890'),
('345678901234567890', 'alice@example.com', 'Alice Johnson', '1988-03-08', 'Female', '5551234567', 'Buddhist', 'Japan', 'WNA', 'DL54321'),
('456789012345678901', 'michael@example.com', 'Michael Brown', '1982-12-30', 'Male', '1112223333', 'Kong Hu Chu', 'Canada', 'WNI', 'DL98765'),
('567890123456789012', 'emily@example.com', 'Emily Davis', '1995-07-18', 'Female', '9998887777', 'Hindu', 'India', 'WNA', 'DL24680');

INSERT INTO addresses (people_id, street, neighbourhood, hamlet, village, urban_village, district, sub_district, province, postal_code)
VALUES
('123456789012345678', 'Jl. Setiabudi', 1, 2, 'Setiabudi', 'Urban Village A', 'South Jakarta', 'Setiabudi', 'DKI Jakarta', '12345'),
('234567890123456789', 'Jl. Sudirman', 2, 3, 'Sudirman', 'Urban Village B', 'Central Jakarta', 'Sudirman', 'DKI Jakarta', '23456'),
('345678901234567890', 'Jl. Thamrin', 3, 1, 'Thamrin', 'Urban Village C', 'Central Jakarta', 'Thamrin', 'DKI Jakarta', '34567'),
('456789012345678901', 'Jl. Gatot Subroto', 4, 2, 'Gatot Subroto', 'Urban Village D', 'South Jakarta', 'Gatot Subroto', 'DKI Jakarta', '45678'),
('567890123456789012', 'Jl. HR Rasuna Said', 5, 3, 'HR Rasuna Said', 'Urban Village E', 'South Jakarta', 'HR Rasuna Said', 'DKI Jakarta', '56789');

INSERT INTO classes (name, study_program, faculty)
VALUES
('Class A', 'Computer Science', 'Faculty of Computer Science'),
('Class B', 'Business Administration', 'Faculty of Business Administration'),
('Class C', 'Economics', 'Faculty of Economics'),
('Class D', 'Arts and Humanities', 'Faculty of Arts and Humanities'),
('Class E', 'Mechanical Engineering', 'Faculty of Engineering');

INSERT INTO students (npm, class, study_program, faculty, level, status, class_year, hobby, language_skill, academic_supervisor, ukt_group, entry_date, photo)
VALUES
('1234567890123', 'Class A', 'Computer Science', 'Faculty of Computer Science', 'S1', 'Active', INTERVAL '2023 years', 'Playing guitar', 'English, Spanish', '123456789012345678', 1, '2023-09-01', 1001),
('2345678901234', 'Class B', 'Business Administration', 'Faculty of Business Administration', 'S1', 'Active', INTERVAL '2023 years', 'Reading books', 'English, French', '234567890123456789', 2, '2023-09-01', 1002),
('3456789012345', 'Class C', 'Economics', 'Faculty of Economics', 'D4', 'Non Active', INTERVAL '2022 years', 'Playing football', 'English, German', '345678901234567890', 3, '2022-09-01', 1003),
('4567890123456', 'Class D', 'Arts and Humanities', 'Faculty of Arts and Humanities', 'S2', 'Active', INTERVAL '2024 years', 'Painting', 'English, Italian', '456789012345678901', 1, '2024-09-01', 1004),
('5678901234567', 'Class E', 'Mechanical Engineering', 'Faculty of Engineering', 'D3', 'Non Active', INTERVAL '2021 years', 'Playing basketball', 'English, Mandarin', '567890123456789012', 2, '2021-09-01', 1005);

INSERT INTO students_courses (student_npm, course_code)
VALUES
('1234567890123', 'COURSE01'),
('2345678901234', 'COURSE02'),
('3456789012345', 'COURSE03'),
('4567890123456', 'COURSE04'),
('5678901234567', 'COURSE05');

INSERT INTO parents (
    student_npm,
    family_card_number,
    father_name,
    mother_name,
    father_birth_date,
    mother_birth_date,
    average_father_income,
    avarage_mother_income,
    father_educational_level,
    mother_educational_level,
    father_work_type,
    mother_work_type,
    amount_family_numbers,
    amount_dependants
)
VALUES
(
    '1234567890123',
    'FCN001',
    'John Doe Sr.',
    'Jane Doe Sr.',
    '1960-05-15',
    '1965-07-22',
    'High',
    'Medium',
    'Bachelor Degree',
    'Associate Degree',
    'Government',
    'Private Sector',
    4,
    2
),
(
    '2345678901234',
    'FCN002',
    'Michael Smith Sr.',
    'Alice Smith Sr.',
    '1958-11-30',
    '1962-04-18',
    'Medium',
    'Low',
    'Master Degree',
    'Senior/Vocational High School',
    'Private Sector',
    'Unemployed',
    3,
    1
),
(
    '3456789012345',
    'FCN003',
    'David Johnson Sr.',
    'Emily Johnson Sr.',
    '1970-02-25',
    '1975-10-12',
    'Low',
    'Low',
    'Senior/Vocational High School',
    'Senior/Vocational High School',
    'Unemployed',
    'Unemployed',
    5,
    3
),
(
    '4567890123456',
    'FCN004',
    'Robert Brown Sr.',
    'Sarah Brown Sr.',
    '1965-09-18',
    '1970-06-30',
    'Medium',
    'Medium',
    'Associate Degree',
    'Bachelor Degree',
    'Private Sector',
    'Government',
    4,
    2
),
(
    '5678901234567',
    'FCN005',
    'William Davis Sr.',
    'Olivia Davis Sr.',
    '1968-12-10',
    '1972-08-05',
    'High',
    'High',
    'Bachelor Degree',
    'Bachelor Degree',
    'Government',
    'Government',
    6,
    4
);

INSERT INTO buildings (
    code,
    name,
    purpose,
    location,
    condition,
    floors_amount,
    last_treatment_date
)
VALUES
(
    'B0001',
    'Main Hall',
    'Auditorium',
    POINT(37.7749, -122.4194),
    'Good',
    3,
    '2023-10-01'
),
(
    'B0002',
    'Library',
    'Education',
    POINT(40.7128, -74.0060),
    'Excellent',
    5,
    '2023-09-15'
),
(
    'B0003',
    'Lab Building',
    'Research',
    POINT(51.5074, -0.1278),
    'Fair',
    4,
    '2023-11-20'
),
(
    'B0004',
    'Sports Complex',
    'Athletics',
    POINT(34.0522, -118.2437),
    'Good',
    2,
    '2023-12-05'
),
(
    'B0005',
    'Dormitory',
    'Residence',
    POINT(35.6895, 139.6917),
    'Excellent',
    8,
    '2023-08-28'
);

INSERT INTO rooms (
    code,
    building_code,
    name,
    type,
    capacity,
    availability_status,
    room_condition,
    facility
)
VALUES
(
    'R001',
    'B0001',
    'Lab 1',
    'Laboratory',
    12,
    'Available',
    'Good',
    'Projector, Sound System'
),
(
    'R002',
    'B0001',
    'Lecturer Room',
    'Lecturer Room',
    50,
    'Available',
    'Excellent',
    'Whiteboard, Teleconference System'
),
(
    'R003',
    'B0002',
    'Study Room 1',
    'Study Room',
    20,
    'Available',
    'Fair',
    'Desks, Chairs'
),
(
    'R004',
    'B0002',
    'Study Room 2',
    'Study Room',
    25,
    'Available',
    'Good',
    'Computers, Printer'
),
(
    'R005',
    'B0003',
    'Lab 101',
    'Laboratory',
    30,
    'Available',
    'Excellent',
    'Lab Equipment, Sinks'
);

INSERT INTO conferences (course_code, room_code, class_name, day, period, agenda, study_material, learning_method)
VALUES
('COURSE01', 'R001', 'Class A', '2023-11-20', '[2023-11-20 08:00, 2023-11-20 10:00)', 'Introduction to Programming', 'Programming Guidebook', 'Online'),
('COURSE02', 'R002', 'Class B', '2023-11-21', '[2023-11-21 09:00, 2023-11-21 11:00)', 'Marketing Strategies', 'Marketing Case Studies', 'Offline'),
('COURSE03', 'R003', 'Class C', '2023-11-22', '[2023-11-22 13:00, 2023-11-22 15:00)', 'Financial Analysis', 'Financial Reports', 'Online'),
('COURSE04', 'R004', 'Class D', '2023-11-23', '[2023-11-23 10:00, 2023-11-23 12:00)', 'Human Resources Management', 'HR Policies Handbook', 'Offline'),
('COURSE05', 'R005', 'Class E', '2023-11-24', '[2023-11-24 14:00, 2023-11-24 16:00)', 'Graphic Design Principles', 'Design Tutorials', 'Online');

INSERT INTO presences (student_npm, conference_id, location, time, photo, status)
VALUES
('1234567890123', 1, POINT(37.7749, -122.4194), '2023-11-20 08:05:00', 1001, 'Present'),
('2345678901234', 2, POINT(40.7128, -74.0060), '2023-11-21 09:10:00', 1002, 'Present'),
('3456789012345', 3, POINT(51.5074, -0.1278), '2023-11-22 13:15:00', 1003, 'Not Present'),
('4567890123456', 4, POINT(34.0522, -118.2437), '2023-11-23 10:02:00', 1004, 'Sick'),
('5678901234567', 5, POINT(35.6895, 139.6917), '2023-11-24 14:30:00', 1005, 'Permit');

INSERT INTO transcripts (student_npm, quality_letters, quality_figures, cummulative_value)
VALUES
('1234567890123', 'A', 3.5, 3.8),
('2345678901234', 'B', 3.2, 3.3),
('3456789012345', 'B-', 3.0, 3.1),
('4567890123456', 'C', 2.5, 2.7),
('5678901234567', 'A-', 3.5, 3.6);

INSERT INTO studies_plans (student_npm, course_code, day, period, note)
VALUES
('1234567890123', 'COURSE01', '2023-12-01', '[2023-12-01 08:00, 2023-12-01 10:00)', 'Prepare for exam'),
('2345678901234', 'COURSE02', '2023-12-02', '[2023-12-02 09:00, 2023-12-02 11:00)', 'Group discussion'),
('3456789012345', 'COURSE03', '2023-12-03', '[2023-12-03 13:00, 2023-12-03 15:00)', 'Homework submission'),
('4567890123456', 'COURSE04', '2023-12-04', '[2023-12-04 10:00, 2023-12-04 12:00)', 'Project presentation'),
('5678901234567', 'COURSE05', '2023-12-05', '[2023-12-05 14:00, 2023-12-05 16:00)', 'Research paper discussion');

INSERT INTO transcripts_courses (transcript_id, courses_code)
VALUES
(1, 'COURSE01'),
(2, 'COURSE02'),
(3, 'COURSE03'),
(4, 'COURSE04'),
(5, 'COURSE05');

INSERT INTO payments (student_npm, type, already_paid, not_yet_paid, paid_off)
VALUES
('1234567890123', 'Herregistration', 1500000, 0, TRUE),
('2345678901234', 'Diplomas and Transcripts', 2000000, 500000, FALSE),
('3456789012345', 'Intermediate Semester Payments', 1000000, 500000, FALSE),
('4567890123456', 'Merdeka Campus Registration', 2500000, 0, TRUE),
('5678901234567', 'Thesis', 3000000, 0, TRUE);

