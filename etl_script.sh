#! /bin/bash
# ETL Process Script

# Setting environment variables
CSV_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"
RAW_DIR="./raw"
TRANSFORMED_DIR="./Transformed"
GOLD_DIR="./Gold" 


# Extract - Downloading CSV file and confirm if save
echo "Starting the extraction process..."
curl -o "$RAW_DIR/annual-enterprise-survey.csv" $CSV_URL

if [[ -f "$RAW_DIR/annual-enterprise-survey.csv" ]]; then
    echo "File downloaded successfully and saved to $RAW_DIR."
else
    echo "File download failed!"
    exit 1
fi

#Transform - Renaming column and select columns
echo "Starting the transformation process..."
csvcut -c year,Value,Units,Variable_code "$RAW_DIR/annual-enterprise-survey.csv" | \
csvsql --query "SELECT year, Value, Units, Variable_code AS variable_code FROM stdin" > "$TRANSFORMED_DIR/2023_year_finance.csv"

if [[ -f "$TRANSFORMED_DIR/2023_year_finance.csv" ]]; then
    echo "Transformation complete and file saved to $TRANSFORMED_DIR."
else
    echo "Transformation failed!"
    exit 1
fi

#Load - Moving transformed data to Gold folder
echo "Starting the load process..."
cp "$TRANSFORMED_DIR/2023_year_finance.csv" "$GOLD_DIR/"

if [[ -f "$GOLD_DIR/2023_year_finance.csv" ]]; then
    echo "File successfully loaded into $GOLD_DIR."
else
    echo "Load process failed!"
    exit 1
fi

echo "ETL process completed successfully!"
