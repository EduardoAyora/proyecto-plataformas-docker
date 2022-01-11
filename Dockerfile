FROM jboss/wildfly:24.0.0.Final

# Deploy JavaEEDemo Application
ADD ./ProyectoFinal.war /opt/jboss/wildfly/standalone/deployments/

##  Change file WAR ownership to jboss:jboss
USER root
RUN chown jboss:jboss /opt/jboss/wildfly/standalone/deployments/ProyectoFinal.war
##  back to jboss user for subsequent commands
USER jboss

# Create a log directory to store log files
RUN mkdir /opt/jboss/wildfly/standalone/log

# Explicitly expose port 8080 (explicit is required by Elastic Beanstalk)
EXPOSE 8080