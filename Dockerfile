FROM tomcat:9.0-jdk11-openjdk

# Remove default apps (optional)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file into the webapps directory
COPY target/onlinebookstore.war /usr/local/tomcat/webapps/onlinebookstore.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]

