#!/bin/bash

# Define the Java version and download URL
echo "Enter Java Version you want to install"
echo -e "JAVA 8\nJAVA 9\nJAVA 10\nJAVA 11\nJAVA 12\nJAVA 13\nJAVA 14\nJAVA 15\nJAVA 16\nJAVA 17\nJAVA 18\nJAVA 19\nJAVA 20\nJAVA 21"
read JAVA_VERSION

JAVA_URL="https://download.java.net/openjdk/jdk${JAVA_VERSION}/ri/openjdk-${JAVA_VERSION}+28_linux-x64_bin.tar.gz"

# Directories for download, extract, and installation
JAVA_DOWNLOAD_DIR="/home/vijay/Java/JavaDownload-${JAVA_VERSION}"
JAVA_EXTRACT_DIR="/home/vijay/Java/JavaExtract-${JAVA_VERSION}"
JAVA_INSTALL_DIR="/home/vijay/Java/JavaInstall-${JAVA_VERSION}"

# Create the download directory if it doesn't exist
mkdir -p $JAVA_DOWNLOAD_DIR

# Create the extract directory if it doesn't exist
mkdir -p $JAVA_EXTRACT_DIR

# Create the installation directory if it doesn't exist
mkdir -p $JAVA_INSTALL_DIR

# Download Java to the specified directory
wget -P $JAVA_DOWNLOAD_DIR $JAVA_URL

# Extract Java to the specified directory
tar -zxvf ${JAVA_DOWNLOAD_DIR}/openjdk-${JAVA_VERSION}+28_linux-x64_bin.tar.gz -C $JAVA_EXTRACT_DIR --strip-components=1

# Copy the extracted files to the installation directory
cp -r $JAVA_EXTRACT_DIR/* $JAVA_INSTALL_DIR

# Configure system alternatives for Java
sudo update-alternatives --install /usr/bin/java java $JAVA_INSTALL_DIR/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac $JAVA_INSTALL_DIR/bin/javac 1

# Set environment variables for Java (optional but recommended)
echo "export JAVA_HOME=$JAVA_INSTALL_DIR" | tee -a ~/.bashrc
echo "export PATH=\$PATH:\$JAVA_HOME/bin" | tee -a ~/.bashrc


# Reload environment variables
source ~/.bashrc

# Set the newly installed Java as the system default
sudo update-alternatives --config java

echo "OpenJDK ${JAVA_VERSION} has been successfully installed to $JAVA_INSTALL_DIR."
source ~/.bashrc
