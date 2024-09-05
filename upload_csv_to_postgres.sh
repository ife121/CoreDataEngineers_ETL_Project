#!/bin/bash

# Database credentials
DB_NAME="posey"
DB_USER="postgres"   # Replace with your PostgreSQL username
DB_HOST="localhost"
DB_PORT="5432"

# Directory where the CSV files are located
CSV_DIR="C:\Users\Administrator\Downloads\parch_and_posey_data"

# Looping through each CSV file in the directory
for file in "$CSV_DIR"/*.csv; do
    # Extracting table name from file name 
    table_name=$(basename "$file" .csv)

    echo "Processing $file into table $table_name..."

    # Creating a table corresponding to each CSV file, assuming the first row contains headers
    head -1 "$file" | awk -F',' '{ 
        printf "CREATE TABLE IF NOT EXISTS %s (", "'$table_name'";
        for(i=1; i<=NF; i++) { 
            printf "%s text", $i; 
            if (i<NF) printf ", "; 
        } 
        print ");"
    }' | psql -U "$DB_USER" -d "$DB_NAME"

    # Coping CSV content into the table
    psql -U "$DB_USER" -d "$DB_NAME" -c "\copy $table_name FROM '$file' WITH CSV HEADER"

    echo "Data copied to table $table_name."
done

echo "All CSV files have been processed."
