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
                 def namespace = 'sangini-ns'
                def context = 'minikube'
                kubectl config set-context ${context} --namespace=${namespace} --cluster=$(kubectl config current-context)
                kubectl apply -f gad.yaml
                '''
            }
        }
    }
}
