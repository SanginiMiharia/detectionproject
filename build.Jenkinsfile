pipeline {
    agent any
    environment {
        AWS_REGION= 'us-east-1'
        ECR_REGISTRY_URL='860705619849.dkr.ecr.us-east-1.amazonaws.com/sangini/gadrepo'
    }
    stages {
        stage('Build') {
            steps {
                sh 'echo building...'
            }
        }
        stage('Building app') {
            steps {
               sh '''
                    aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin 187851048168.dkr.ecr.eu-north-1.amazonaws.com
                    docker build -t sangini/gadrepo .
                    docker tag sangini/gadrepo:latest 187851048168.dkr.ecr.eu-north-1.amazonaws.com/sangini/gadrepo:$BUILD_NUMBER
                    docker push 187851048168.dkr.ecr.eu-north-1.amazonaws.com/sangini/gadrepo:$BUILD_NUMBER 
                    
               '''
           }
        }
        stage('Trigger Deploy') {
              steps {
                  build job: 'gadDeploy', wait: false, parameters: [
                      string(name: 'gad_IMAGE_URL', value: "187851048168.dkr.ecr.eu-north-1.amazonaws.com/sangini/gadrepo:$BUILD_NUMBER ")
                  ]
              }
        }
    }
}