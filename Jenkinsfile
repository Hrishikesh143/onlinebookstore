pipeline {  
    agent any
	tools {
        // Use the Maven and JDK tool names you configured in Jenkins Global Tool Configuration
        maven 'Maven'   // Replace with your Maven name
        jdk 'Java'      // Replace with your JDK name if available, else set JAVA_HOME as env
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
                sh 'mvn clean install'  // Runs the Maven build
            }
  	   }
        stage("docker_build") {
            steps {
                echo "Building Docker image"
                // Build Docker image, tag it
                sh 'docker build -t my-java-app:latest .'
            }
 	}
        stage("docker_run") {
            steps {
                echo "Running Docker container"
                // Stop and remove any existing container with same name
                sh '''
                docker run -d -p 8080:8080 --name my-java-container my-java-app:latest
                '''
            }
        }
	}
}
