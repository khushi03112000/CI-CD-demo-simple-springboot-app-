pipeline {
    agent {
    docker {
      image 'maven:3.8.1-jdk-8'  // Use Maven Docker image with JDK 8
    }
  }

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id') // Create this in Jenkins Credentials
        IMAGE_NAME = 'khushi0311/simple-springboot-app'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/khushi031120000/CI-CD-demo-simple-springboot-app-.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials-id', usernameVariable: 'khushi0311', passwordVariable: 'Momopanda@03')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $IMAGE_NAME'
            }
        }

        stage('Run Container (Optional)') {
            steps {
                // Clean up old containers if already running
                sh '''
                docker rm -f springboot-container || true
                docker run -d --name springboot-container -p 8080:8080 $IMAGE_NAME
                '''
            }
        }
    }
}
