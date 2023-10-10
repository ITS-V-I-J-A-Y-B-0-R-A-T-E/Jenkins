#!/bin/bash

TOMCAT_VERSION="9.0.80"
DOWNLOAD_DIR="/home/vijay/bashprogramming/Jenkins/DownloadTomcatFiles"  #  directory where you want to download Tomcat
EXTRACT_DIR="/home/vijay/bashprogramming/Jenkins/ExtractingTomcatFiles"  #  directory where you want to extract Tomcat

# Create the download directory if it doesn't exist
mkdir -p $DOWNLOAD_DIR

# Create the extract directory if it doesn't exist
mkdir -p $EXTRACT_DIR

# Download Tomcat to the specified directory
wget -P $DOWNLOAD_DIR https://downloads.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Extract Tomcat to the specified directory
tar -zxvf ${DOWNLOAD_DIR}/apache-tomcat-${TOMCAT_VERSION}.tar.gz -C $EXTRACT_DIR

# Start Tomcat
${EXTRACT_DIR}/apache-tomcat-${TOMCAT_VERSION}/bin/startup.sh
