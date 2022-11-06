# Demo Test API Automation for DemoToken #
## 1 - Prequeties ##
Download Tools : Git, JDK1.8, Docker , Aapache-maven-3.8.6 , IDE: Intellij Idea

## 2 - Get DemoToken Project ##
`git clone git clone https://bitbucket.org/Izicap/demo-token.git`

Buid Project on Docker:
1 - Build Image for the Project 
`cd demo-token`
`docker build -t demo-token .`
To verify the created image
`docker images`

2 - Run the image demo-token
`docker run -p 80:8080 demo-token`

At this moment we can call the demo-token API

## 3 - Get DemoTokenAPI Project ##
I used Apache Karate https://github.com/karatelabs/karate : Karate is the only open-source tool to combine API test-automation, mocks, performance-testing and even UI automation into a single, unified framework. The BDD syntax popularized by Cucumber is language-neutral, and easy for even non-programmers. Assertions and HTML reports are built-in, and you can run tests in parallel for speed.

I created a maven project and developed the scripts for tests cases to verify the folowing:
1 - Test the creation of the token : 3 Test Cases to verify the return HTTP status
HTTP response status

201 (Created) : successful token creation

200 (OK) : successful token refresh

401 (Unauthorized) : incorrect username/password combination is used

2- Test the creation of users after creating the token:
HTTP response status

201 (Created) : successful user creation

409 (Conflict) : if attempting to create a duplicate user

401 (Unauthorized) : call without a valid unexpired token

403 (Forbidden) : call with a valid unexpired non-admin token


## 4 - Upload the project on github ##
This actual Project , branch Master

## 5 - Download Jenkins on Docker and run Jenkins ##
`docker pull jenkins/jenkins`
run jenkins on port 9092
`docker run -p 9092:8080  jenkins/jenkins`


## 6 - Configure Jenkins ##
open http://localhost:9092/
Create User
Create Item Pipeline DemoPipelineTokenAPITestAuto (job)
Go to Configure-> Pipeline (fill the repository and path of jenkins)
![image](https://user-images.githubusercontent.com/13651357/200199449-c8aade96-0689-48d9-a038-be6a87f88b22.png)

## 7 - Build the job ##
After it is finish, you will find the report summry in the job #number -> Workspaces-> target -> surefire-reports -> karate-summary.html


## Conclusion ##
This is a sample demo for Apache Karate Framework to test API project
This demo runs all the tests cases, we can add tags in each test case  and run tests cases by tags
