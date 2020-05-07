SELECT * FROM college_type;
SELECT * FROM salaries_per_major;
SELECT * FROM school_majors;
SELECT * FROM college_type;
SELECT * FROM regions;

DROP TABLE IF EXISTS school_majors;

CREATE TABLE school_majors (
    Major_id SERIAL PRIMARY KEY,
    UNITID FLOAT
);

ALTER TABLE salaries_per_major ADD COLUMN ID SERIAL PRIMARY KEY;
ALTER TABLE salaries_per_major DROP CONSTRAINT salaries_per_major_pkey;
ALTER TABLE salaries_per_major 
RENAME COLUMN id TO Major_id;
