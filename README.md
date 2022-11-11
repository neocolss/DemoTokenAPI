# Demo Test API Automation for DemoToken #
## 1 - Prequeties ##
Download Tools : Git, JDK1.8, Docker , Aapache-maven-3.8.6 , IDE: Intellij Idea

## 2 - Get DemoToken Project ##

`git clone https://bitbucket.org/Izicap/demo-token.git`

Buid Project on Docker: 

1 - Build Image for the Project 

`cd demo-token`

`docker build -t demo-token .`

To verify the created image `docker images`

2 - Run the image demo-token

`docker run --rm -d -P  demo-token`   

(-P to be able for containers to communicate each other, otherwise you will get this message)
![image](https://user-images.githubusercontent.com/13651357/201325189-5da0c1c7-2b77-4d17-8a14-f06f4c73ccd2.png)


Go to CMD and run `docker ps` and note the port generated for the container demo-token (49153 in our case)
![image](https://user-images.githubusercontent.com/13651357/201325315-ec859e09-9305-4fd5-8e00-6deb30383e66.png)

This port is configured in https://github.com/neocolss/DemoTokenAPI/blob/master/src/test/java/karate-config.js
## 3 - Get DemoTokenAPI Project ##
I used Apache Karate https://github.com/karatelabs/karate : Karate is the only open-source tool to combine API test-automation, mocks, performance-testing and even UI automation into a single, unified framework. The BDD syntax popularized by Cucumber is language-neutral, and easy for even non-programmers. Assertions and HTML reports are built-in, and you can run tests in parallel for speed.

I created a maven project (with apache karate archetype) and developed the scripts for tests cases to verify the folowing:

1 - Test the creation of the token : 3 Test Cases to verify the return HTTP status

HTTP response status

201 (Created) : successful token creation

200 (OK) : successful token refresh

401 (Unauthorized) : incorrect username/password combination is used

2- Test the E2E creation of users after creating the token:

HTTP response status

201 (Created) : successful user creation

409 (Conflict) : if attempting to create a duplicate user

401 (Unauthorized) : call without a valid unexpired token

403 (Forbidden) : call with a valid unexpired non-admin token


## 4 - Upload the project on github ##

This actual Project , branch Master

## 5 - Download Jenkins on Docker and run Jenkins ##
`docker run -p 8081/8080 -v /var/run/docker.sock:/var/run/docker.sock liatrio/jenkins-alpine`


## 6 - Configure Jenkins ##
open http://localhost:8081/

Login with admin/admin

Create Item Pipeline DemoPipelineTokenAPITestAuto (job)

Go to Configure-> Pipeline (fill the repository and path of jenkinsfile)

![ererer](https://user-images.githubusercontent.com/13651357/201326159-0309d950-181e-47c0-bd56-85b4d861ebf1.png)


## 7 - Build the job ##
After it is finish, you will find the report summry in the  /usr/src/app/target/surefire-reports
![je](https://user-images.githubusercontent.com/13651357/201329932-9a902440-db3d-4aa8-a2f6-91387f1d7efb.png)



## Conclusion ##
This is a sample demo for Apache Karate Framework to test API project from jenkins on docker.
