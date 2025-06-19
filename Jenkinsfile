pipeline {
    agent any
    tools {
        maven 'Maven'   // Replace with your Maven name
        jdk 'Java'      // Replace with your JDK name if available
    }
    stages {
        stage("git_checkout") {
            steps {
                echo "cloning repository"
                echo "repo cloned successfully"
            }
        }
        stage("build") {
            steps {
                echo "Building with Maven"
                sh 'mvn clean install'
            }
        }
        stage("docker_build") {
            steps {
                script {
                    try {
                        def proceed = input message: 'Do you want to build the Docker image?', parameters: [booleanParam(defaultValue: true, description: '', name: 'Proceed?')]
                        if (proceed) {
                            echo "Building Docker image"
                            sh 'docker build -t my-java-app:latest .'
                        } else {
                            echo "Skipping Docker build stage"
                        }
                    } catch (org.jenkinsci.plugins.workflow.steps.FlowInterruptedException e) {
                        echo "Input aborted, skipping Docker build stage"
                    }
                }
            }
        }
        stage("docker_run") {
            steps {
                script {
                    try {
                        def proceed = input message: 'Do you want to run the Docker container?', parameters: [booleanParam(defaultValue: true, description: '', name: 'Proceed?')]
                        if (proceed) {
                            echo "Running Docker container"
                            sh '''
                                docker run -d -p 8000:8080 --name my-java-container my-java-app:latest
                            '''
                        } else {
                            echo "Skipping Docker run stage"
                        }
                    } catch (org.jenkinsci.plugins.workflow.steps.FlowInterruptedException e) {
                        echo "Input aborted, skipping Docker run stage"
                    }
                }
            }
        }
        stage('Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s/namespace.yaml'
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
            }
        }
    }
}

