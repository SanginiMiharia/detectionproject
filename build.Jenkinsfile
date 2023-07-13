pipeline {
    agent any
    environment {
        AWS_REGION= 'us-east-2'
        ECR_REGISTRY_URL='854171615125.dkr.ecr.us-east-2.amazonaws.com/nishant_detection'
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
                    aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 854171615125.dkr.ecr.us-east-2.amazonaws.com
                    docker build -t nishant_detection .
                    docker tag nishant_detection:latest 854171615125.dkr.ecr.us-east-2.amazonaws.com/nishant_detection:latest
                    docker push 854171615125.dkr.ecr.us-east-2.amazonaws.com/nishant_detection:latest
               '''
           }
        }
        stage('Trigger Deploy') {
              steps {
                  build job: 'gadDeploy', wait: false, parameters: [
                      string(name: 'gad_IMAGE_URL', value: "854171615125.dkr.ecr.us-east-2.amazonaws.com/nishant_detection:latest")
                  ]
              }
        }
    }
}

