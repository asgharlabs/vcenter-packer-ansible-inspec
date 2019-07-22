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
        stage('\u27A1 Master-Inflate variables.json') {
            when {
                expression {
                    return env.GIT_BRANCH == "origin/master"
                }
            }
            steps {
                sh 'cp /home/admini/variables.json $WORKSPACE/debian10/variables.json'
            }
        }
        stage('\u27A1 Inflate variables.json') {
            when {
                not {
                    expression {
                        return env.GIT_BRANCH == "origin/master"
                    }
                }
            }
            steps {
                sh 'cp /home/admini/notmaster-variables.json $WORKSPACE/debian10/notmaster-variables.json'
            }
        }
        stage('\u27A1 Master-Build image with packer') {
            when {
                expression {
                    return env.GIT_BRANCH == "origin/master"
                }
            }
            steps {
                sh '$WORKSPACE/packer build -var-file=$WORKSPACE/debian10/variables.json $WORKSPACE/debian10/debian.json'
            }
        }
        stage('\u27A1 Build image with packer') {
            when {
                not {
                    expression {
                        return env.GIT_BRANCH == "origin/master"
                    }
                }
            }

            steps {
                sh '$WORKSPACE/packer build -var-file=$WORKSPACE/debian10/notmaster-variables.json $WORKSPACE/debian10/debian.json'
            }
        }
        stage('\u27A1 Master-Change VM to gold template and archive old template') {
            when {
                expression {
                    return env.GIT_BRANCH == "origin/master"
                }
            }
            steps {
                sh 'docker run --rm --entrypoint="/usr/bin/pwsh" -v $WORKSPACE/:/mnt vmware/powerclicore /mnt/.ciscripts/Convert-Machine-to-Gold-Template-and-archive.ps1'
            }
        }
        stage('\u27A1 Gotta clean up after ourselves') {
            steps {
                sh '''sudo apt-get remove --purge ansible -y;
                  sudo apt-get autoremove -y'''
            }

        }
    }
    post {
        always {
            sh 'rm -fr $WORKSPACE/*;'
        }
    }
}
