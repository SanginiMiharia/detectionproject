pipeline {
    agent any
    parameters { string(name: 'gad_IMAGE_URL', description: 'App-Deploy') }

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
