#!/bin/bash

set -e

TOMCAT_VERSION="9.0.82"
DOWNLOAD_DIR="/home/vijay/bashprogramming/Jenkins/DownloadTomcatFiles"
EXTRACT_DIR="/home/vijay/bashprogramming/Jenkins/ExtractingTomcatFiles"

# Create the download directory if it doesn't exist
sudo mkdir -p "$DOWNLOAD_DIR"
echo "Download directory created or already exists."

# Create the extract directory if it doesn't exist
sudo mkdir -p "$EXTRACT_DIR"
echo "Extraction directory created or already exists."

# Download Tomcat to the specified directory
sudo wget -P "$DOWNLOAD_DIR" "https://downloads.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz"
echo "Tomcat downloaded successfully."

# Extract Tomcat to the specified directory
sudo tar -zxvf "${DOWNLOAD_DIR}/apache-tomcat-${TOMCAT_VERSION}.tar.gz" -C "$EXTRACT_DIR"
echo "Tomcat extracted successfully."

# Start Tomcat
sudo "${EXTRACT_DIR}/apache-tomcat-${TOMCAT_VERSION}/bin/startup.sh"
echo "Tomcat started successfully."
