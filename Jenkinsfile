pipeline {
    agent any

    stages {
        stage('Checkout Source') {
            steps {
                git branch: 'main', url: 'https://github.com/spring-projects/spring-petclinic.git'
            }
        }
        stage('Build Project') {
            steps {
                sh './mvnw package'
            }
        }
        stage('Build & Push Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com/v1/', 'docker') {
                        docker.build('nilanjanb3/spring-petclinic').push('${BUILD_NUMBER}')
                    }
                }
            }
            
        }
        stage('Delete Source') {
            steps {
                sh 'cd .. && rm -rf spring-petclinic'
            }
        }
    }
}
