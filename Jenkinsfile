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
        }
}
