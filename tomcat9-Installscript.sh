#!/bin/bash
echo "Tomcat script started"
TOMCAT_VERSION="9.0.80"
DOWNLOAD_DIR="/home/ncs/Downloads/TOMCATINSTALLATION/Jenkins/DownloadTomcatFiles"  #  directory where you want to download Tomcat
EXTRACT_DIR="/home/ncs/Downloads/TOMCATINSTALLATION/ExtractingTomcatFiles"  #  directory where you want to extract Tomcat

echo "Creating folder-> /home/ncs/Downloads/TOMCATINSTALLATION/Jenkins/DownloadTomcatFiles "
# Create the download directory if it doesn't exist
mkdir -p $DOWNLOAD_DIR
if [ $? -eq 0 ]; then
    echo "DOWNLOAD DIRECTORY CREATED --> /home/ncs/Downloads/TOMCATINSTALLATION/Jenkins/DownloadTomcatFiles"
else
    echo "****Cannot create folder --> /home/ncs/Downloads/TOMCATINSTALLATION/Jenkins/DownloadTomcatFiles"
fi

# Create the extract directory if it doesn't exist
mkdir -p $EXTRACT_DIR
if [ $? -eq 0 ]; then
    echo "EXTARCTING DIRECTORY CREATED --> /home/ncs/Downloads/TOMCATINSTALLATION/Jenkins/DownloadTomcatFiles"
else
    echo "****Cannot create EXTRACTING  folder --> /home/ncs/Downloads/TOMCATINSTALLATION/ExtractingTomcatFiles"
fi

# Download Tomcat to the specified directory
wget -P $DOWNLOAD_DIR https://downloads.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
if [ $? -eq 0 ]; then
    echo "Download TOMCAT SUCCESFULL AT  --> /home/ncs/Downloads/TOMCATINSTALLATION/Jenkins/DownloadTomcatFiles"
else
    echo "****DOWNLOAD FAILED"
fi

# Extract Tomcat to the specified directory
tar -zxvf ${DOWNLOAD_DIR}/apache-tomcat-${TOMCAT_VERSION}.tar.gz -C $EXTRACT_DIR
if [ $? -eq 0 ]; then
    echo "extracting   TOMCAT SUCCESFULL AT  --> /home/ncs/Downloads/TOMCATINSTALLATION/Jenkins/DownloadTomcatFiles"
else
    echo "****EXTARCTION FAILED"
fi

# Start Tomcat
${EXTRACT_DIR}/apache-tomcat-${TOMCAT_VERSION}/bin/startup.sh
if [ $? -eq 0 ]; then
    echo "starting tomcat SUCCESSSS"
else
    echo "****starting tomcat FAILED"
fi

