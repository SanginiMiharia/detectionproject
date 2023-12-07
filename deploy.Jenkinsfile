pipeline {
    agent any
    parameters { string(name: 'gad_IMAGE_URL', description: 'App-Deploy') }

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