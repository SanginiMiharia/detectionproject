pipeline {
    agent any
    parameters { string(name: 'gad_IMAGE_URL', defaultValue: '854171615125.dkr.ecr.us-east-2.amazonaws.com/nishant_detection:latest', description: 'App-Deploy') }

    stages {
        stage('Deploy') {
            steps {
                 sh '''
                aws eks --region us-east-2 update-kubeconfig --name k8s-batch1
                kubectl config set-context --current --namespace=nishant-ns
                kubectl apply -f gad.yaml
                '''
            }
        }
    }
}
