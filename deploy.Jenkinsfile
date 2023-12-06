pipeline {
    agent any
    parameters { string(name: 'gad_IMAGE_URL', description: 'App-Deploy') }

    stages {
        stage('Deploy') {
            steps {
                 sh '''
                kubectl config set-context --current --namespace=sangini-ns
                kubectl apply -f gad.yaml
                '''
            }
        }
    }
}
