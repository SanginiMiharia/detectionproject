pipeline {
    agent any
    environment {
        AWS_REGION= 'us-east-1'
        ECR_REGISTRY_URL='public.ecr.aws/d9o2f8i2/sangini/gadrepo'
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
                    aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/d9o2f8i2
                    docker build -t sangini/gadrepo .
                    docker tag sangini/gadrepo:latest public.ecr.aws/d9o2f8i2/sangini/gadrepo:$BUILD_NUMBER
                    docker push public.ecr.aws/d9o2f8i2/sangini/gadrepo:$BUILD_NUMBER
               '''
           }
        }
        stage('Trigger Deploy') {
              steps {
                  build job: 'gadDeploy', wait: false, parameters: [
                      string(name: 'gad_IMAGE_URL', value: "public.ecr.aws/d9o2f8i2/sangini/gadrepo:$BUILD_NUMBER")
                  ]
              }
        }
    }
}