DROP DATABASE university_academic;
CREATE DATABASE university_academic;

DROP TABLE lecturers;
CREATE TABLE IF NOT EXISTS lecturers(
    nip CHAR(18) PRIMARY KEY NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    birth_date DATE NOT NULL,
    expertise VARCHAR(255) NOT NULL,
    telephone VARCHAR(13) NOT NULL,
    position VARCHAR(50) NOT NULL,
    work_experience VARCHAR(255),
    join_date DATE NOT NULL,
    title VARCHAR(50) NOT NULL,
    last_education VARCHAR(50) NOT NULL
);

CREATE TYPE courses_type AS ENUM('Required', 'Option');

DROP TABLE courses;
CREATE TABLE IF NOT EXISTS courses(
    code CHAR(8) PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    sks SMALLINT NOT NULL,
    type courses_type NOT NULL,
    semester SMALLINT NOT NULL,
    prerequisite CHAR(8),
    lecturer CHAR(18) NOT NULL,
    description TEXT,
    CONSTRAINT fk_courses_lecturers FOREIGN KEY (lecturer) REFERENCES lecturers (nip)
);

DROP TABLE study_programs;
CREATE TABLE IF NOT EXISTS study_programs(
    code VARCHAR(10) PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    manager CHAR(18) UNIQUE NOT NULL,
    amount_students INT NOT NULL,
    description TEXT
);

DROP TABLE curricula;
CREATE TABLE IF NOT EXISTS curricula(
    code CHAR(5) PRIMARY KEY NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL,
    implementation_schedule DATE NOT NULL,
    study_program VARCHAR(10) NOT NULL,
    description TEXT,
    last_updated DATE,
    CONSTRAINT fk_curricula_study_programs FOREIGN KEY (study_program) REFERENCES courses(code)
);



CREATE TABLE student(
    npm VARCHAR(13) PRIMARY KEY NOT NULL,
    full_name VARCHAR(50) NOT NULL,
)