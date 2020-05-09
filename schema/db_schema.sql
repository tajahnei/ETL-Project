CREATE TABLE "colleges" (
    "college_id" int   NOT NULL,
    "name" varchar   NOT NULL,
    "type" varchar   NOT NULL,
    "website" varchar   NOT NULL,
    "city" varchar   NOT NULL,
    "state" varchar(2)   NOT NULL,
    "zipcode" varchar(5)   NOT NULL,
    "latitude" float   NOT NULL,
    "longitutde" float   NOT NULL,
    "state_fips" int   NOT NULL,
    "region" varchar   NOT NULL,
    CONSTRAINT "pk_colleges" PRIMARY KEY (
        "college_id"
     )
);

CREATE TABLE "regions" (
    "zipcode" varchar(5)   NOT NULL,
    "cbsa_code" int(5)   NOT NULL,
    "title" varchar   NOT NULL,
    "state_name" varchar   NOT NULL,
    "state_fips" int   NOT NULL,
    "metro" varchar   NOT NULL,
    CONSTRAINT "pk_regions" PRIMARY KEY (
        "zipcode"
     )
);

CREATE TABLE "majors" (
    "major_id" int   NOT NULL,
    "major" varchar   NOT NULL,
    CONSTRAINT "pk_majors" PRIMARY KEY (
        "major_id"
     )
);

CREATE TABLE "college_majors" (
    "college_id" int   NOT NULL,
    "major_id" int   NOT NULL,
    CONSTRAINT "pk_college_majors" PRIMARY KEY (
        "college_id","major_id"
     )
);

CREATE TABLE "salaries_per_major" (
    "major_id" int   NOT NULL,
    "starting_median_salary" float   NOT NULL,
    "midcareer_median_salary" float   NOT NULL,
    CONSTRAINT "pk_salaries_per_major" PRIMARY KEY (
        "major_id"
     )
);

CREATE TABLE "salaries_per_college" (
    "college_id" int   NOT NULL,
    "starting_median_salary" float   NOT NULL,
    "midcareer_median_salary" float   NOT NULL,
    CONSTRAINT "pk_salaries_per_college" PRIMARY KEY (
        "college_id"
     )
);

ALTER TABLE "colleges" ADD CONSTRAINT "fk_colleges_zipcode_state_fips" FOREIGN KEY("zipcode", "state_fips")
REFERENCES "regions" ("zipcode", "state_fips");

ALTER TABLE "college_majors" ADD CONSTRAINT "fk_college_majors_college_id" FOREIGN KEY("college_id")
REFERENCES "colleges" ("college_id");

ALTER TABLE "college_majors" ADD CONSTRAINT "fk_college_majors_major_id" FOREIGN KEY("major_id")
REFERENCES "majors" ("major_id");

ALTER TABLE "salaries_per_major" ADD CONSTRAINT "fk_salaries_per_major_major_id" FOREIGN KEY("major_id")
REFERENCES "majors" ("major_id");

ALTER TABLE "salaries_per_college" ADD CONSTRAINT "fk_salaries_per_college_college_id" FOREIGN KEY("college_id")
REFERENCES "colleges" ("college_id");
