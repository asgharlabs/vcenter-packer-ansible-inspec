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
                      wget -o $WORKSPACE/packer-builder-vsphere-clone.linux https://github.com/jetbrains-infra/packer-builder-vsphere/releases/download/v2.3/packer-builder-vsphere-clone.linux;
                      chmod +x $WORKSPACE/packer-builder-vsphere-clone.linux;
                   '''
            }
        }
        stage('\u27A1 Inflate variables.json') {
            steps {
                sh 'cp /home/admini/variables.json $WORKSPACE/debian10/variables.json'
            }
        }
        stage('\u27A1 Build image with packer') {
            steps {
                sh '$WORKSPACE/packer build $WORKSPACE/debian10/debian.json'
            }
        }
        
    }
    post {
        always {
            sh '''rm -fr $WORKSPACE/*'''
        }
    }
}

