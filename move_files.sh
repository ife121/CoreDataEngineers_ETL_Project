#! /bin/bash

# Source directory where the CSV and JSON files are located
SOURCE_DIR="/C:/Users/Administrator/Desktop/CoreDataEngineers/move_CSV_and_JSON/document_JSON_and_CSV"

# Destination directory where CSV and JSON files will be moved
DEST_DIR="/C:/Users/Administrator/Desktop/CoreDataEngineers/move_CSV_and_JSON/json_and_csv"

# To Check if the destination directory exists; if not, create it
if [ ! -d "$DEST_DIR" ]; then
    echo "Creating destination directory: $DEST_DIR"
    mkdir -p "$DEST_DIR"
else
    echo "Destination directory already exists: $DEST_DIR"
fi

# To Move all CSV files from the source directory to the destination directory
echo "Moving CSV files..."
mv "$SOURCE_DIR"/*.csv "$DEST_DIR" 2>/dev/null

# To Move all JSON files from the source directory to the destination directory
echo "Moving JSON files..."
mv "$SOURCE_DIR"/*.json "$DEST_DIR" 2>/dev/null

# To Check if the move operation was successful
if [ $? -eq 0 ]; then
    echo "All CSV and JSON files have been moved to $DEST_DIR successfully!"
else
    echo "No CSV or JSON files found to move, or an error occurred."
fi
