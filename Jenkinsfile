pipeline {
    agent any
   
    stages {
	stage('\u27A1 Install ansible') {
            steps {
                sh '''sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
                      sudo apt update
                      sudo apt install -y ansible'''
            }
        }
        stage('\u27A1 Install Packer') {
            steps {
                sh '''wget https://releases.hashicorp.com/packer/1.4.2/packer_1.4.2_linux_amd64.zip;
                      unzip packer_1.4.2_linux_amd64.zip;
                   '''
            }
        }
        stage('\u27A1 Run') {
            steps {
                sh '$WORKSPACE/packer --version'
            }
        }
        
    }
    post {
        always {
            sh '''rm -fr $WORKSPACE/*'''
        }
    }
}

