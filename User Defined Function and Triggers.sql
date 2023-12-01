-- Membuat fungsi yang akan mengupdate nilai lecturers_amount pada tabel faculties
CREATE OR REPLACE FUNCTION update_lecturers_amount(fac_name VARCHAR(50)) RETURNS VOID AS
$$
DECLARE
    lecturer_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO lecturer_count FROM lecturers WHERE faculty_name = fac_name;

    UPDATE faculties SET lecturers_amount = lecturer_count WHERE name = fac_name;
END;
$$ LANGUAGE plpgsql;

-- Membuat trigger setelah INSERT pada tabel lecturers
CREATE OR REPLACE FUNCTION after_insert_lecturers_trigger()
    RETURNS TRIGGER AS
$$
BEGIN
    -- Memanggil fungsi update_lecturers_amount dengan nama fakultas yang sesuai
    PERFORM update_lecturers_amount(NEW.faculty_name);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Membuat trigger setelah INSERT pada tabel lecturers
CREATE TRIGGER lecturers_after_insert_trigger
    AFTER INSERT
    ON lecturers
    FOR EACH ROW
EXECUTE FUNCTION after_insert_lecturers_trigger();

-- Membuat fungsi untuk trigger
CREATE OR REPLACE FUNCTION insert_presences_histories()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO presences_histories (student_npm, conference_id, location, time, photo, status)
    VALUES (NEW.student_npm, NEW.conference_id, NEW.location, NEW.time, NEW.photo, NEW.status);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Membuat trigger
CREATE TRIGGER log_presence_histories
AFTER INSERT ON presences
FOR EACH ROW EXECUTE FUNCTION insert_presences_histories();

-- Membuat fungsi untuk trigger
CREATE OR REPLACE FUNCTION insert_payments_histories()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO payments_histories (student_npm, type, already_paid, not_yet_paid, paid_off)
    VALUES (NEW.student_npm, NEW.type, NEW.already_paid, NEW.not_yet_paid, NEW.paid_off);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Membuat trigger
CREATE TRIGGER log_payments_histories
AFTER INSERT ON payments
FOR EACH ROW EXECUTE FUNCTION insert_payments_histories();
