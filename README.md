# CoreDataEngineers ETL Project

## Project Overview
This project performs an ETL process using Bash scripts and stores data into a PostgreSQL database. It also includes SQL queries to analyze the data.

### Folder Structure
- `Scripts/Bash`: Contains Bash scripts for the ETL process, file movement, and data loading.
- `Scripts/SQL`: Contains SQL scripts for data analysis.

### ETL Process
1. **Extract**: Downloads CSV file into `raw` folder.
2. **Transform**: Renames column and selects specific fields, saving output in `Transformed`.
3. **Load**: Moves the transformed file into the `Gold` folder.

### SQL Queries
The SQL queries answer the following questions:
1. List of order IDs where either gloss_qty or poster_qty is greater than 4000.
2. Orders where standard_qty is zero and gloss_qty or poster_qty is over 1000.
3. Company names starting with 'C' or 'W', and primary contact contains 'ana' but not 'eana'.
4. Sales rep regions with associated accounts, sorted alphabetically.

### How to Run
- Bash scripts can be executed by running `bash <script_name.sh>`.
- SQL queries can be run in PostgreSQL via the `psql` command-line tool.
# CoreDataEngineers_ETL_Project
