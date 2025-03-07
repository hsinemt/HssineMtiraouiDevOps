FROM openjdk:8-jdk-alpine
EXPOSE 8082
ADD target/timesheetproject-1.0.jar timesheetproject-1.0.jar
ENTRYPOINT ["java","-jar","/timesheetproject-1.0.jar"]
	
