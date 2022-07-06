pipeline {
    environment {
        imageName = 'santhoshnath/todo'
        containerName = 'todo'
        kubernetesFile = 'kubernetes.yaml'
    }
    agent any
    stages {
        stage('Build image') {
            steps {
                sh "docker build -t $imageName ."
                sh "docker push $imageName"
                sh "docker rmi $imageName"
            }
        }
        stage('Approve to Deploy') {
            steps {
                input "Deploy image?"
            }
        }
        stage('Deploy image') {
            steps {
                sh "kubectl apply -f $kubernetesFile"
            }
        }
    }
}
