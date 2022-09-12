pipeline {
    agent any
    stages {
        // Creating a Virtual Environment
        stage('Create_vEnv') {
            // when {
            //     branch 'main'
            // }
            steps {
            sh '''
            python3 -m pip install --user virtualenv
            which python3
            read PYDIR
            python3 -m virtualenv --python=$PYDIR .env
            source .env/bin/activate
            make install
            '''
            }
        }

        // Jenkins Stage to Build the Docker Image
        stage('Build_Image') {
            // when {
            //     branch 'main'
            // }
            steps {
            sh "sudo docker build -t shubhamborkar/myapp:v1.0 ."
            }
        }

        // Jenkins Stage to Publish the Docker Image.
        stage('Publish_Image') {
            // when {
            //     branch 'main'
            // }
            steps {
            sh '''
            sudo chmod 666 /var/run/docker.sock
            cat docpasswd.txt | docker login --username shubhamborkar --password-stdin
            sudo docker push shubhamborkar/myapp:v1.0
            '''
            }

        }
    }
}