DROP TABLE IF EXISTS salaries_per_major;
DROP TABLE IF EXISTS salaries_per_college;
DROP TABLE IF EXISTS college_majors;
DROP TABLE IF EXISTS majors;
DROP TABLE IF EXISTS colleges;
DROP TABLE IF EXISTS regions;

CREATE TABLE IF NOT EXISTS colleges (
    college_id INTEGER PRIMARY KEY,
    name VARCHAR,
    website VARCHAR,
    type VARCHAR,
    city VARCHAR,
    state VARCHAR(2),
    zipcode VARCHAR(5),
    latitude FLOAT,
    longitude FLOAT,
    state_fips INTEGER,
    region VARCHAR
);

CREATE TABLE IF NOT EXISTS regions (
    zipcode VARCHAR PRIMARY KEY,
    latitude FLOAT,
    longitude FLOAT,
    state_fips INTEGER,
    region VARCHAR
);

CREATE TABLE majors (
    major_id INTEGER PRIMARY KEY,
    major VARCHAR
);

CREATE TABLE college_majors (
    major_id INTEGER PRIMARY KEY,
    college_id INTEGER REFERENCES colleges(college_id)
);

CREATE TABLE salaries_per_college (
    college_id INTEGER PRIMARY KEY REFERENCES colleges(college_id),
    starting_median_salary FLOAT,
    midcareer_median_salary FLOAT
);

CREATE TABLE salaries_per_major (
    major_id INTEGER PRIMARY KEY REFERENCES majors(major_id),
    starting_median_salary FLOAT,
    midcareer_median_salary FLOAT
);
