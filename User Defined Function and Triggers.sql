-- Membuat fungsi yang akan mengupdate nilai lecturers_amount pada tabel faculties
CREATE OR REPLACE FUNCTION update_lecturers_amount(fac_name VARCHAR(50)) RETURNS VOID AS $$
DECLARE
    lecturer_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO lecturer_count FROM lecturers WHERE faculty_name = fac_name;

    UPDATE faculties SET lecturers_amount = lecturer_count WHERE name = fac_name;
END;
$$ LANGUAGE plpgsql;

-- Membuat trigger setelah INSERT pada tabel lecturers
CREATE OR REPLACE FUNCTION after_insert_lecturers_trigger()
RETURNS TRIGGER AS $$
BEGIN
    -- Memanggil fungsi update_lecturers_amount dengan nama fakultas yang sesuai
    PERFORM update_lecturers_amount(NEW.faculty_name);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Membuat trigger setelah INSERT pada tabel lecturers
CREATE TRIGGER lecturers_after_insert_trigger
AFTER INSERT ON lecturers
FOR EACH ROW
EXECUTE FUNCTION after_insert_lecturers_trigger();
