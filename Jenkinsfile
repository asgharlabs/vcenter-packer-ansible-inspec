pipeline {
    agent any

    stages {
	stage('\u27A1 Install ansible') {
            steps {
                sh '''sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
                      sudo apt-get update
                      sudo apt-get install -y ansible'''
            }
        }
        stage('\u27A1 Install Packer') {
            steps {
                sh '''wget https://releases.hashicorp.com/packer/1.4.2/packer_1.4.2_linux_amd64.zip;
                      unzip packer_1.4.2_linux_amd64.zip;
                      $WORKSPACE/packer --version;
                      wget -O $WORKSPACE/packer-builder-vsphere-clone.linux https://github.com/jetbrains-infra/packer-builder-vsphere/releases/download/v2.3/packer-builder-vsphere-clone.linux;
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
                sh '$WORKSPACE/packer build -var-file=$WORKSPACE/debian10/variables.json $WORKSPACE/debian10/debian.json'
            }
        }
        stage('\u27A1 Change VM to gold template and archive old template') {
            steps {
                sh '''docker run --rm -v $WORKSPACE/:/mnt vmware/powerclicore /mnt/.ciscripts/Convert-Machine-to-Gold-Template-and-archive.ps1;
                docker run --rm -v $WORKSPACE:/mnt vmware/powerclicore /mnt/.ciscripts/Delete-Temp-Success-Image.ps1'''
            }
        }

    }
    post {
        always {
            sh '''rm -fr $WORKSPACE/*;
                  sudo apt-get remove --purge ansible -y;
                  sudo apt-get autoremove -y'''
        }
    }
}
