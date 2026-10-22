FROM tomcat:9.0-jdk11-corretto
RUN rm -rf /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/docs /usr/local/tomcat/webapps/examples /usr/local/tomcat/webapps/host-manager /usr/local/tomcat/webapps/manager
COPY web /usr/local/tomcat/webapps/attendance
COPY src/attendance/Attend.java /usr/local/tomcat/webapps/attendance/WEB-INF/classes/
RUN cd /usr/local/tomcat/webapps/attendance/WEB-INF/classes/ && javac -cp /usr/local/tomcat/lib/servlet-api.jar Attend.java
COPY entrypoint.sh /usr/local/tomcat/bin/entrypoint.sh
RUN chmod +x /usr/local/tomcat/bin/entrypoint.sh
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/entrypoint.sh"]
