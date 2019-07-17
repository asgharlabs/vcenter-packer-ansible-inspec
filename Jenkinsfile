pipeline {
    agent any
   
    stages {
	stage('\u27A1 Install ansible') {
            steps {
                sh '''sudo apt-get -y update;
                      sudo apt install software-properties-common;
                      sudo apt-add-repository --yes --update ppa:ansible/ansible;
                      sudo apt install ansible'''
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

