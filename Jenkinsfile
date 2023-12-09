pipeline {
    agent {
        label 'wsl'
    }
    stages {
        stage('Checkout Source') {
            steps {
                git branch: 'main', url: 'https://github.com/nilanjanb3/spring-petclinic.git'
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
                    docker.withRegistry('https://registry.hub.docker.com/v1/', 'nilanjanb3-docker') {
                        def dockerBuild = docker.build('nilanjanb3/spring-petclinic')
                        dockerBuild.push("${BUILD_NUMBER}")
                        dockerBuild.push("latest")
                    }
                }
            }
            
        }
    }
}
