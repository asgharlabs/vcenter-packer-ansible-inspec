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
                      $WORKSPACE/packer --version;
                      wget -o $WORKSPACE/debian10/packer-builder-vsphere-clone.linux https://github.com/jetbrains-infra/packer-builder-vsphere/releases/download/v2.3/packer-builder-vsphere-clone.linux;
                      chmod +x $WORKSPACE/debian10/packer-builder-vsphere-clone.linux;
                      ls -l $WORKSPACE/debian10/packer-builder-vsphere-clone.linux
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

