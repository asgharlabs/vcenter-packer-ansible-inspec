pipeline {
    agent any
   
    stages {
	stage('\u27A1 Install ansible') {
            steps {
                sh '''deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main
                      sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
                      sudo apt update
                      sudo apt install -y ansible'''
            }
        }
        stage('\u27A1 Build') {
            steps {
                sh 'echo "Hello World"'
            }
        }
        stage('\u27A1 Run') {
            steps {
                sh 'echo "Goodbye World"'
            }
        }
        
    }
    post {
        always {
            sh '''rm -fr $WORKSPACE/*'''
        }
    }
}

