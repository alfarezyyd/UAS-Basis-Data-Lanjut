DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
DROP DATABASE university_academic;
CREATE DATABASE university_academic;
SELECT *
FROM pg_tables
WHERE schemaname = 'public';

DROP TABLE IF EXISTS faculties;
CREATE TABLE faculties
(
    name               VARCHAR(50) PRIMARY KEY NOT NULL,
    email              VARCHAR(50) UNIQUE      NOT NULL,
    dean               CHAR(18),
    telephone          VARCHAR(15)             NOT NULL,
    lecturers_amount   SMALLINT                NOT NULL DEFAULT 0,
    establishment_date DATE                    NOT NULL,
    description        TEXT
);


DROP TABLE IF EXISTS lecturers;
CREATE TABLE IF NOT EXISTS lecturers
(
    nip             CHAR(18) PRIMARY KEY NOT NULL,
    full_name       VARCHAR(50)          NOT NULL,
    email           VARCHAR(50) UNIQUE   NOT NULL,
    birth_date      DATE                 NOT NULL,
    expertise       VARCHAR(255)         NOT NULL,
    telephone       VARCHAR(13)          NOT NULL,
    position        VARCHAR(50)          NOT NULL,
    faculty_name    VARCHAR(50)          NOT NULL,
    work_experience VARCHAR(255),
    join_date       DATE                 NOT NULL,
    last_education  VARCHAR(50)          NOT NULL,
    CONSTRAINT fk_lecturers_faculties FOREIGN KEY (faculty_name) REFERENCES faculties (name)
);

CREATE TABLE expertises
(
    id   SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255)       NOT NULL
);

CREATE TABLE lecturers_expertises
(
    lecturer_nip CHAR(18) NOT NULL,
    expertise_id SERIAL   NOT NULL,
    UNIQUE (lecturer_nip, expertise_id),
    CONSTRAINT fk_lecturers_expertises_lecturers FOREIGN KEY (lecturer_nip) REFERENCES lecturers (nip),
    CONSTRAINT fk_lecturers_expertises_expertises FOREIGN KEY (expertise_id) REFERENCES expertises (id)
);

CREATE TABLE position
(
    id   SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255)       NOT NULL
);


CREATE TABLE lecturers_positions
(
    lecturer_nip CHAR(18) NOT NULL,
    positions_id SERIAL   NOT NULL,
    UNIQUE (lecturer_nip, positions_id),
    CONSTRAINT fk_lecturers_positionss_lecturers FOREIGN KEY (lecturer_nip) REFERENCES lecturers (nip),
    CONSTRAINT fk_lecturers_positionss_positionss FOREIGN KEY (positions_id) REFERENCES expertises (id)
);

CREATE TABLE works_experiences(
    lecturer_nip CHAR(18) NOT NULL,
    amount_years SMALLINT NOT NULL,
    works_field VARCHAR(255) NOT NULL,
    CONSTRAINT fk_works_experiences_lecturers FOREIGN KEY (lecturer_nip) REFERENCES lecturers (nip)
);

ALTER TABLE faculties
    ADD CONSTRAINT fk_faculties_lecturers FOREIGN KEY (dean) REFERENCES lecturers (nip);


DROP TABLE IF EXISTS study_programs;
CREATE TABLE IF NOT EXISTS study_programs
(
    name            VARCHAR(50) PRIMARY KEY NOT NULL,
    manager         CHAR(18) UNIQUE         NOT NULL,
    amount_students INT                     NOT NULL DEFAULT 0,
    description     TEXT
);

CREATE TYPE courses_type AS ENUM ('Compulsory', 'Elective');

DROP TABLE IF EXISTS courses;
CREATE TABLE IF NOT EXISTS courses
(
    code               CHAR(8) PRIMARY KEY NOT NULL,
    study_program_name VARCHAR(50)         NOT NULL,
    name               VARCHAR(50)         NOT NULL,
    sks                SMALLINT            NOT NULL,
    type               courses_type        NOT NULL,
    semester           SMALLINT            NOT NULL,
    prerequisite       CHAR(8),
    description        TEXT,
    CONSTRAINT fk_courses_study_programs FOREIGN KEY (study_program_name) REFERENCES study_programs (name),
    CONSTRAINT fk_prerequisite_courses FOREIGN KEY (prerequisite) REFERENCES courses (code)
);

CREATE TABLE lecturers_courses
(
    lecturer_nip CHAR(18) NOT NULL,
    course_code  CHAR(8)  NOT NULL,
    UNIQUE (lecturer_nip, course_code),
    CONSTRAINT fk_lecturers_courses_lecturer FOREIGN KEY (lecturer_nip) REFERENCES lecturers (nip),
    CONSTRAINT fk_lecturers_courses_course FOREIGN KEY (course_code) REFERENCES courses (code)
);

DROP TABLE IF EXISTS curricula;
CREATE TABLE IF NOT EXISTS curricula
(
    code                    CHAR(5) PRIMARY KEY NOT NULL,
    name                    VARCHAR(50) UNIQUE  NOT NULL,
    implementation_schedule DATE                NOT NULL,
    study_program           VARCHAR(50)         NOT NULL,
    description             TEXT,
    last_updated            DATE,
    CONSTRAINT fk_curricula_study_programs FOREIGN KEY (study_program) REFERENCES study_programs (name)
);

CREATE TABLE curricula_courses
(
    curricula_code CHAR(5) NOT NULL,
    course_code    CHAR(8) NOT NULL,
    UNIQUE (curricula_code, course_code),
    CONSTRAINT fk_curricula_courses_curricula FOREIGN KEY (curricula_code) REFERENCES curricula (code),
    CONSTRAINT fk_curricula_courses_course FOREIGN KEY (course_code) REFERENCES courses (code)
);

CREATE TYPE gender_enum AS ENUM ('Male', 'Female');
CREATE TYPE religion_enum AS ENUM ('Muslim', 'Christian', 'Hindu', 'Buddhist', 'Kong Hu Chu');
CREATE TYPE citizenship_enum AS ENUM ('WNA', 'WNI');

DROP TABLE IF EXISTS people;
CREATE TABLE people
(
    identity_card_number   CHAR(18) PRIMARY KEY NOT NULL,
    email                  VARCHAR(100) UNIQUE  NOT NULL,
    name                   VARCHAR(50)          NOT NULL,
    birth_date             DATE                 NOT NULL,
    gender                 gender_enum          NOT NULL,
    telephone              VARCHAR(15)          NOT NULL,
    religion               religion_enum        NOT NULL,
    origin_country         VARCHAR(100)         NOT NULL,
    citizenship            citizenship_enum     NOT NULL,
    driving_license_number VARCHAR(30)          NOT NULL
);

DROP TABLE IF EXISTS addresses;
CREATE TABLE addresses
(
    people_id     CHAR(18)    NOT NULL,
    street        VARCHAR(50) NOT NULL,
    neighbourhood SMALLINT    NOT NULL,
    hamlet        SMALLINT    NOT NULL,
    village       VARCHAR(50) NOT NULL,
    urban_village VARCHAR(50) NOT NULL,
    district      VARCHAR(50) NOT NULL,
    sub_district  VARCHAR(50) NOT NULL,
    province      VARCHAR(50) NOT NULL,
    postal_code   CHAR(5)     NOT NULL,
    CONSTRAINT fk_addresses_people FOREIGN KEY (people_id) REFERENCES people (identity_card_number)
);


DROP TABLE IF EXISTS classes;
CREATE TABLE classes
(
    name          VARCHAR(50) PRIMARY KEY NOT NULL,
    study_program VARCHAR(50)             NOT NULL,
    faculty       VARCHAR(50)             NOT NULL,
    CONSTRAINT fk_classes_study_programs FOREIGN KEY (study_program) REFERENCES study_programs (name),
    CONSTRAINT fk_classes_faculties FOREIGN KEY (faculty) REFERENCES faculties (name)
);


CREATE TYPE level_enum AS ENUM ('D3', 'D4', 'S1', 'S2', 'S3');
CREATE TYPE status_enum AS ENUM ('Active', 'Non Active');

/* Just for documentation
DROP TABLE IF EXISTS students;
CREATE TABLE students
(
    npm                 CHAR(13) PRIMARY KEY NOT NULL,
    class               VARCHAR(50)          NOT NULL,
    study_program       VARCHAR(50)          NOT NULL,
    faculty             VARCHAR(50)          NOT NULL,
    level               level_enum           NOT NULL,
    status              status_enum          NOT NULL,
    class_year          CHAR(10)        NOT NULL,
    hobby               VARCHAR(255)         NOT NULL,
    language_skill      VARCHAR(255)         NOT NULL,
    academic_supervisor CHAR(18)             NOT NULL,
    ukt_group           SMALLINT             NOT NULL,
    entry_date          DATE                 NOT NULL,
    photo               BYTEA                  NOT NULL,
    CONSTRAINT fk_students_classes FOREIGN KEY (class) REFERENCES classes (name),
    CONSTRAINT fk_students_study_programs FOREIGN KEY (study_program) REFERENCES study_programs (name),
    CONSTRAINT fk_students_faculties FOREIGN KEY (faculty) REFERENCES faculties (name),
    CONSTRAINT fk_students_lecturers FOREIGN KEY (academic_supervisor) REFERENCES lecturers (nip)
);

*/

DROP TABLE IF EXISTS students;
CREATE TABLE students
(
    npm                 CHAR(13) PRIMARY KEY NOT NULL,
    class               VARCHAR(50)          NOT NULL,
    study_program       VARCHAR(50)          NOT NULL,
    faculty             VARCHAR(50)          NOT NULL,
    level               level_enum           NOT NULL,
    status              status_enum          NOT NULL,
    class_year          CHAR(10)             NOT NULL,
    academic_supervisor CHAR(18)             NOT NULL,
    ukt_group           SMALLINT             NOT NULL,
    entry_date          DATE                 NOT NULL,
    photo               BYTEA                NOT NULL,
    CONSTRAINT fk_students_classes FOREIGN KEY (class) REFERENCES classes (name),
    CONSTRAINT fk_students_study_programs FOREIGN KEY (study_program) REFERENCES study_programs (name),
    CONSTRAINT fk_students_faculties FOREIGN KEY (faculty) REFERENCES faculties (name),
    CONSTRAINT fk_students_lecturers FOREIGN KEY (academic_supervisor) REFERENCES lecturers (nip)
);

CREATE TABLE hobbies
(
    id   SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255)       NOT NULL
);

CREATE TABLE students_hobbies
(
    student_npm CHAR(13) NOT NULL,
    hobby_id    SERIAL   NOT NULL,
    UNIQUE (student_npm, hobby_id),
    CONSTRAINT fk_students_hobbies_students FOREIGN KEY (student_npm) REFERENCES students (npm),
    CONSTRAINT fk_students_hobbies_hobbies FOREIGN KEY (hobby_id) REFERENCES hobbies (id)
);

CREATE TABLE languages
(
    id   SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255)       NOT NULL
);

CREATE TABLE students_languages_skills
(
    student_npm CHAR(13) NOT NULL,
    language_id SERIAL   NOT NULL,
    UNIQUE (student_npm, language_id),
    CONSTRAINT fk_students_languages_skills_students FOREIGN KEY (student_npm) REFERENCES students (npm),
    CONSTRAINT fk_students_languages_skills_languages FOREIGN KEY (language_id) REFERENCES languages (id)
);

CREATE TABLE students_courses
(
    student_npm CHAR(13) NOT NULL,
    course_code CHAR(8)  NOT NULL,
    grade       NUMERIC(3, 2),
    UNIQUE (student_npm, course_code),
    CONSTRAINT fk_students_courses_student FOREIGN KEY (student_npm) REFERENCES students (npm),
    CONSTRAINT fk_students_courses_course FOREIGN KEY (course_code) REFERENCES courses (code),
    CONSTRAINT grade_check CHECK (grade >= 0 AND grade <= 4)
);

CREATE TYPE educational_level AS ENUM ('Elementary School', 'Junior High School', 'Senior/Vocational High School', 'Diploma 3', 'Bachelor Degree', 'Associate Degree', 'Master Degree');
CREATE TYPE work_type AS ENUM ('Government', 'Private Sector', 'Civil Servants', 'Unemployed');

CREATE TABLE parents
(
    student_npm              CHAR(13)          NOT NULL,
    family_card_number       VARCHAR(20)       NOT NULL,
    father_name              VARCHAR(50)       NOT NULL,
    mother_name              VARCHAR(50)       NOT NULL,
    father_birth_date        DATE              NOT NULL,
    mother_birth_date        DATE              NOT NULL,
    average_father_income    VARCHAR(50)       NOT NULL,
    avarage_mother_income    VARCHAR(50)       NOT NULL,
    father_educational_level educational_level NOT NULL,
    mother_educational_level educational_level NOT NULL,
    father_work_type         work_type         NOT NULL,
    mother_work_type         work_type         NOT NULL,
    amount_family_numbers    SMALLINT          NOT NULL,
    amount_dependants        SMALLINT          NOT NULL,
    CONSTRAINT fk_parents_students FOREIGN KEY (student_npm) REFERENCES students (npm)
);
CREATE TYPE buildings_purpose AS ENUM ('Rectorate', 'Athletics', 'Auditorium', 'Library', 'Research', 'Residence', 'Education');
CREATE TYPE buildings_condition AS ENUM ('Good', 'Fair', 'Not Good', 'Excellent');

CREATE TABLE buildings
(
    code                CHAR(5) PRIMARY KEY NOT NULL,
    name                VARCHAR(50)         NOT NULL,
    purpose             buildings_purpose   NOT NULL,
    location            POINT               NOT NULL,
    condition           buildings_condition NOT NULL,
    floors_amount       SMALLINT            NOT NULL,
    last_treatment_date DATE
);

CREATE TYPE room_type AS ENUM ('Laboratory', 'Lecturer Room', 'Staff Room', 'Study Room');
CREATE TYPE availability_status_enum AS ENUM ('Available', 'Not Available');
CREATE TYPE room_condition_enum AS ENUM ('Good', 'Fair', 'Not Good', 'Excellent');


CREATE TABLE rooms
(
    code                CHAR(4) PRIMARY KEY      NOT NULL,
    building_code       CHAR(5)                  NOT NULL,
    name                VARCHAR(50)              NOT NULL,
    type                room_type                NOT NULL,
    capacity            SMALLINT                 NOT NULL,
    availability_status availability_status_enum NOT NULL,
    room_condition      room_condition_enum      NOT NULL,
    facility            VARCHAR(255)             NOT NULL,
    CONSTRAINT fk_rooms_buildings FOREIGN KEY (building_code) REFERENCES buildings (code)
);

CREATE TYPE learning_method_enum AS ENUM ('Online', 'Offline');

DROP TABLE IF EXISTS conferences;
CREATE TABLE conferences
(
    id              SERIAL PRIMARY KEY   NOT NULL,
    course_code     CHAR(8)              NOT NULL,
    room_code       CHAR(4)              NOT NULL,
    class_name      VARCHAR(50)          NOT NULL,
    day             DATE                 NOT NULL,
    period          TSRANGE              NOT NULL,
    agenda          VARCHAR(255)         NOT NULL,
    study_material  VARCHAR(255)         NOT NULL,
    learning_method learning_method_enum NOT NULL,
    CONSTRAINT fk_conferences_courses FOREIGN KEY (course_code) REFERENCES courses (code),
    CONSTRAINT fk_conferences_rooms FOREIGN KEY (room_code) REFERENCES rooms (code),
    CONSTRAINT fk_conferences_classes FOREIGN KEY (class_name) REFERENCES classes (name)
);

CREATE TYPE status_presence AS ENUM ('Present', 'Not Present', 'Sick', 'Permit');

DROP TABLE IF EXISTS presences;
CREATE TABLE presences
(
    student_npm   CHAR(13)        NOT NULL,
    conference_id SERIAL          NOT NULL,
    location      POINT           NOT NULL,
    time          TIMESTAMP       NOT NULL,
    photo         BYTEA           NOT NULL,
    status        status_presence NOT NULL DEFAULT 'Not Present',
    UNIQUE (student_npm, conference_id),
    CONSTRAINT fk_presences_students FOREIGN KEY (student_npm) REFERENCES students (npm),
    CONSTRAINT fk_presences_conferences FOREIGN KEY (conference_id) REFERENCES conferences (id)
);

DROP TABLE IF EXISTS presences_histories;
CREATE TABLE presences_histories
(
    student_npm   CHAR(13)        NOT NULL,
    conference_id SERIAL          NOT NULL,
    location      POINT           NOT NULL,
    time          TIMESTAMP       NOT NULL,
    photo         BYTEA           NOT NULL,
    status        status_presence NOT NULL DEFAULT 'Not Present',
    UNIQUE (student_npm, conference_id),
    CONSTRAINT fk_presences_students FOREIGN KEY (student_npm) REFERENCES students (npm),
    CONSTRAINT fk_presences_conferences FOREIGN KEY (conference_id) REFERENCES conferences (id)
);

CREATE TYPE quality_letters_enum AS ENUM ('A', 'A-', 'B', 'B-', 'C', 'C-', 'D');

CREATE TABLE transcripts
(
    id                SERIAL PRIMARY KEY   NOT NULL,
    student_npm       CHAR(18)             NOT NULL,
    quality_letters   quality_letters_enum NOT NULL,
    quality_figures   NUMERIC(3, 2)        NOT NULL,
    cummulative_value NUMERIC(3, 2)        NOT NULL,
    UNIQUE (student_npm),
    CONSTRAINT fk_transcripts_students FOREIGN KEY (student_npm) REFERENCES students (npm),
    CONSTRAINT quality_figures CHECK (quality_figures >= 0 AND quality_figures <= 4)

);


CREATE TABLE studies_plans
(
    student_npm CHAR(18) NOT NULL,
    course_code CHAR(8)  NOT NULL,
    day         DATE     NOT NULL,
    period      TSRANGE  NOT NULL,
    note        TEXT,
    UNIQUE (student_npm, course_code),
    CONSTRAINT fk_studies_plans_students FOREIGN KEY (student_npm) REFERENCES students (npm),
    CONSTRAINT fk_studies_plans_courses FOREIGN KEY (course_code) REFERENCES courses (code)
);

CREATE TABLE transcripts_courses
(
    transcript_id SERIAL  NOT NULL,
    courses_code  CHAR(8) NOT NULL,
    CONSTRAINT fk_transcripts_courses_transcripts FOREIGN KEY (transcript_id) REFERENCES transcripts (id),
    CONSTRAINT fk_transcripts_courses_courses FOREIGN KEY (courses_code) REFERENCES courses (code)
);

CREATE TYPE payments_type_enum AS ENUM ('Herregistration', 'Merdeka Campus Registration', 'Diplomas and Transcripts', 'Conversion Payments', 'Intermediate Semester Payments', 'Graduation Registration', 'Thesis', 'Registration of Prospective Students', 'New Student Re-registration');

CREATE TABLE payments
(
    id           SERIAL PRIMARY KEY NOT NULL,
    student_npm  CHAR(18)           NOT NULL,
    type         payments_type_enum NOT NULL,
    time         TIMESTAMP                   DEFAULT NOW(),
    already_paid INT                NOT NULL,
    not_yet_paid INT                NOT NULL DEFAULT 0,
    paid_off     BOOLEAN                     DEFAULT FALSE,
    CONSTRAINT fk_payments_students FOREIGN KEY (student_npm) REFERENCES students (npm)
);

CREATE TABLE payments_histories
(
    id           SERIAL             NOT NULL,
    student_npm  CHAR(18)           NOT NULL,
    type         payments_type_enum NOT NULL,
    time         TIMESTAMP                   DEFAULT NOW(),
    already_paid INT                NOT NULL,
    not_yet_paid INT                NOT NULL DEFAULT 0,
    paid_off     BOOLEAN                     DEFAULT FALSE,
    CONSTRAINT fk_payments_histories_payments FOREIGN KEY (id) REFERENCES payments (id),
    CONSTRAINT fk_payments_histories_students FOREIGN KEY (student_npm) REFERENCES students (npm)
);

CREATE TABLE payments_recapitulations
(
    student_npm CHAR(18) NOT NULL,
    total_spend INT      NOT NULL DEFAULT 0,
    UNIQUE (student_npm),
    CONSTRAINT fk_payments_recapitulations_students FOREIGN KEY (student_npm) REFERENCES students (npm)
);