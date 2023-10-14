pipeline {
    agent any

    stages {
        stage('Clone-Stage') {
            steps {
                echo "We are in ******Clone-Stage**** ,CLONING GITHUB REPO INTO JENKINS SERVER"
                git branch: 'main', url: 'https://github.com/ITS-V-I-J-A-Y-B-0-R-A-T-E/Jenkins.git'
                echo "CLONING DONE ,EXITING ****Clone-Stage****"
            }
        }

        stage('Build-Stage') {
            steps {
                echo "We are in ******Build-Stage******, Executing Tomcat script file Kept in Jenkins Server"
                script {
                    sh 'chmod 777 tomcat9-Installscript.sh' // changing the permission of the script
                    def exitCode = sh(script: './tomcat9-Installscript.sh', returnStatus: true)
                    if (exitCode == 0) {
                        echo "TOMCAT 9 INSTALLED SUCCESSFULLY: ${exitCode}"
                    } else {
                        error "TOMCAT INSTALLATION FAILED: ${exitCode}"
                    }
                }
                echo "EXITING******Build-Stage******, BUILD COMPLETED"
            }
        }
    }
}
