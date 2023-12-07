pipeline {
    agent any
    parameters { string(name: 'gad_IMAGE_URL', description: 'App-Deploy') }
    
    environment {
        AWS_REGION= 'us-east-1'
        ECR_REGISTRY_URL='860705619849.dkr.ecr.us-east-1.amazonaws.com/sangini/gadrepo'

    stages {
        stage('Deploy') {
            steps {
                 sh '''
                 aws eks --region eu-north-1 update-kubeconfig --name minorcluster
                kubectl config set-context --current --namespace=sangini-ns
                kubectl apply -f gad.yaml
                
                '''
            }
        }
    }
}
}