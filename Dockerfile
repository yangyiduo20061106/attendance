FROM tomcat:9.0-jdk11-corretto
RUN rm -rf /usr/local/tomcat/webapps/*
COPY web /usr/local/tomcat/webapps/attendance
COPY src/attendance/Attend.java /usr/local/tomcat/webapps/attendance/WEB-INF/classes/attendance/
RUN cd /usr/local/tomcat/webapps/attendance/WEB-INF/classes/ && javac -cp /usr/local/tomcat/lib/servlet-api.jar attendance/Attend.java
COPY entrypoint.sh /usr/local/tomcat/bin/entrypoint.sh
RUN chmod +x /usr/local/tomcat/bin/entrypoint.sh
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/entrypoint.sh"]
