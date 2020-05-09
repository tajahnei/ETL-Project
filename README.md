# ETL-Project

### Project Proposal

How does salary vary by region with regard to major and type of educational institution?
 
This project will deliver a holistic analysis of salary ranges among top university majors. Each region has not been adjusted for cost of living, but rather the likelihood of achieving a higher salary depending on where you attend college and what area you concentrate on. We will try to account for the recent boom in technology driven vocational programs. Has the ongoing shift to digital learning and non traditional higher education afforded Americans a more affordable path to the middle class?


### Data Sources: 
WSJ - Salaries by college, region, and academic major

https://www.kaggle.com/wsj/college-salaries

 College Majors DATASET IN FIVETHIRTYEIGHT

https://data.world/fivethirtyeight/college-majors

US Census - Educational attainment and employment status

https://www.census.gov/programs-surveys/acs/data/pums.html
https://www.census.gov/topics/income-poverty/data/datasets.html

US Bureau of Labor Statistics - Employment & Pay

https://www.bls.gov/help/hlpforma.htm#SM

Glassdoor Economic Research

https://www.glassdoor.com/research/job-market-report-historical/

Other Resources

https://cew.georgetown.edu/cew-reports/valueofcollegemajors/#explore-data
https://www.census.gov/about/policies/open-gov/open-data.html
https://nces.ed.gov/datatools/index.asp?DataToolSectionID=1
https://www.glassdoor.com/research/job-market-report-historical/


Determine which industries/sectors will bounce back/recover quicker.  



Project 2: ETL Challenge

This project was completed by Thomas, Ahmad and Tajahnei.

The project will examine a database with data showing the average salary per college major and if certain schools award you a higher salary over the course of your career. The reader can determine if the salary increase outweighs the cost of the degree at more expensive schools. It has been aggregated at 'school_type' which will tell us if there's any pattern in salary growth amoung public or private institutions. After researching census data, we were able to cross reference the salary at each school with the zipcode to measure the average salary in each region. The process involved collecting standardized data from 4 sources and identifying real world considerations when choosing a college.

These are the steps that were taken:

EXTRACT:

Pandas read_csv function was used to extract data from the follow 2 data sources and load it into a pandas dataframe-

1. https://collegescorecard.ed.gov/data/ (ETL-Project/data/scorecard

2. https://www.kaggle.com/wsj/college-salaries  (ETL-Project/data/kaggle)

Used Python for loop to extract and combine data from numerous Excel and Pdf files and load it into a Pandas dataframe-

3. https://www2.census.gov/programs-surveys/metro-micro/geographies/reference-files/2018/delineation-files/ (ETL-Project/data/cbsa)

4. https://www2.census.gov/programs-surveys/cps/methodology/ (ETL-Project/data/cbsa)



TRANSFORM:

Datasource 1.

Step 1 - Create College Scorecard Data Dictionary (colleges table)
Step 2 - keep only the first 5 characters of the zip code, select currently operating schools, select degree granting schools only, filter data and save as updated dataframe (colleges table)
Step 3 - columns renamed as user friendly labels for use in database (colleges tables)
Step 4 - drop last two rows (colleges table)
Step 5 - update region names using the data dictionary provided by College Scorecard (colleges table)

Datasource 2.

Step 1 - drop any rows with a missing college id (colleges table)
Step 2 - convert the college id to an integer (colleges table)
Step 3 - rename the `UNITID` column to `college_id` ( To join with college_type, colleges, and salaries_per_college) 
Step 4 - sort college_id & reset index (schools dataframe --> colleges table)
Step 5 - Import school types from Kaggle CSV file (colleges table)
Step 6 - drop any rows with a missing college id (colleges table)
Step 7 - convert the college id to an integer &  rename the UNITID column to college_id ( to join college_type, colleges, and salaries_per_college tables on college_id)
Step 8 - update school types of Party or State to Public (college_types table)
Step 9 - drop duplicates(college_types table)
Step 10 - remove data for schools that no longer exist (college_types table)
Step 11 - remove dollar sign from salary and transform salary columns to float in salaries_per_major and college_type tables
Step 12 - rename columns so that all tables have school names and majors under column with the same name (college_type, colleges, and salaries_per_major tables)
Step 13 - merge Kaggle schools data with Scorecard schools data on college_id (colleges table)
Step 14 - replace missing Kaggle school type with Scorecard school type (colleges & college_type table)
Step 15 - delete unneeded columns & rename needed columns to name column (to match college_types with colleges table)
Step 16 - set college id as the index (to join colleges, college_type, and salary_per_college)

Datasource 3. 

Step 1 - rename columns (regions table)
Step 2 - drop any duplicate rows (regions table)
Step 3 - sort table by zip code (regions table)

Datasource 4.

Step 1 - drop any duplicate rows (regions table)
Step 2 - replace missing csa titles with the cbsa title (regions table)
Step 3 - sort table by zip code (regions table)
Step 4 - reset the index (regions table
Step 5 - make sure that the cbsa codes are integers (regions table)
Step 6 - delete unneeded columns (regions table
Step 7 - drop rows with any missing data (regions table
Step 8 - restructure columns (regions table)
Step 9 - Glassdoor Metro Areas and lookup keys (regions table)
Step 10 - create metro column in table with default string 'N/A' (regions table)
Step 11 - loop through lookup keys (regions table)
Step 12 - set glassdoor metro name where lookup key is found in CBSA title (regions table)

Datasource 3. & 4.

Step 1 - merge transformations into one table for storing to the database (regions table)
Step 2 - drop any duplicate rows (regions table)
Step 3 - drop rows with any missing data (regions table)
Step 4 - reset the index (regions table
Step 5 - make sure that the codes are integers (regions table)
Step 6 - set zipcode as the index (regions table)



LOAD: 
The tables have all been created in Pandas so the code uses sql alchemy to load all tables into postgres

A Diagram outlining the relationships between all of the table has been created in QuickDB and loaded into pgAdmin to create a sql file.































