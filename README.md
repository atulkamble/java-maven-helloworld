```
mvn exec:java -Dexec.mainClass="com.example.App"

mvn exec:java

mvn package
java -cp target/hello-maven-1.0-SNAPSHOT.jar com.example.App

mvn package
java -cp target/hello-maven-1.0-SNAPSHOT.jar com.example.App

mvn exec:java

source ~/.zshrc && mvnrun
```
# Java Maven Hello World Project on Amazon Linux

## 1️⃣ Launch EC2 Instance

Launch an **Amazon Linux EC2 instance**.

Connect using SSH:

```bash
ssh -i key.pem ec2-user@EC2-PUBLIC-IP
```

---

# 2️⃣ Update System

```bash
sudo yum update -y
```

---

# 3️⃣ Install Java (OpenJDK)

Check available Java packages:

```bash
sudo yum search openjdk
```

Install **Java 17** (recommended):

```bash
sudo yum install java-17-amazon-corretto -y
```

Verify installation:

```bash
java -version
```

Example output:

```
openjdk version "17.x"
```

---

# 4️⃣ Install Maven

```bash
sudo yum install maven -y
```

Verify:

```bash
mvn -version
```

Example:

```
Apache Maven 3.9.x
Java version: 17
```

---

# 5️⃣ Create Maven Project

Generate project using Maven archetype.

```bash
mvn archetype:generate \
-DgroupId=com.example \
-DartifactId=hello-maven \
-DarchetypeArtifactId=maven-archetype-quickstart \
-DinteractiveMode=false
```

---

# 6️⃣ Navigate to Project

```bash
cd hello-maven
```

Project structure:

```
hello-maven
│
├── pom.xml
│
└── src
    ├── main
    │   └── java
    │       └── com
    │           └── example
    │               └── App.java
    │
    └── test
        └── java
            └── com
                └── example
                    └── AppTest.java
```

---

# 7️⃣ Update Hello World Code

Open file:

```bash
vi src/main/java/com/example/App.java
```

Update code:

```java
package com.example;

public class App {

    public static void main(String[] args) {

        System.out.println("Hello World from Amazon Linux Maven Project!");

    }

}
```

Save and exit.

---

# 8️⃣ Compile Project

```bash
mvn compile
```

This creates compiled classes in:

```
target/classes/
```

---

# 9️⃣ Run Application

Run using Java:

```bash
java -cp target/classes com.example.App
```

Output:

```
Hello World from Amazon Linux Maven Project!
```

---

# 🔟 Package Application (Create JAR)

```bash
mvn package
```

JAR file location:

```
target/hello-maven-1.0-SNAPSHOT.jar
```

Run the JAR:

```bash
java -cp target/hello-maven-1.0-SNAPSHOT.jar com.example.App
```

---

# 1️⃣1️⃣ Maven Lifecycle Stages

This project is configured with **all 7 Maven lifecycle stages**:

## Complete Lifecycle Flow

```
VALIDATE → COMPILE → TEST → PACKAGE → VERIFY → INSTALL → DEPLOY
```

| Stage    | Command        | Description                              |
| -------- | -------------- | ---------------------------------------- |
| 1️⃣ **VALIDATE** | `mvn validate` | Validate project structure & requirements |
| 2️⃣ **COMPILE**  | `mvn compile`  | Compile source code                       |
| 3️⃣ **TEST**     | `mvn test`     | Run unit tests (*Test.java)               |
| 4️⃣ **PACKAGE**  | `mvn package`  | Create JAR file                           |
| 5️⃣ **VERIFY**   | `mvn verify`   | Run integration tests (*IT.java)          |
| 6️⃣ **INSTALL**  | `mvn install`  | Install to local Maven repository         |
| 7️⃣ **DEPLOY**   | `mvn deploy`   | Deploy to remote repository               |

## Quick Commands

Run all stages at once:

```bash
mvn clean deploy
```

Run through verify (recommended for testing):

```bash
mvn clean verify
```

Run individual stage:

```bash
mvn validate    # Stage 1
mvn compile     # Stage 2
mvn test        # Stage 3
mvn package     # Stage 4
mvn verify      # Stage 5
mvn install     # Stage 6
mvn deploy      # Stage 7
```

## Run Application

```bash
# Using Maven exec plugin
mvn exec:java

# Or run the JAR directly
java -jar target/hello-maven-1.0-SNAPSHOT.jar
```

## Helper Scripts

View quick reference:

```bash
./maven-commands.sh
```

Run all stages with detailed output:

```bash
./run-all-stages.sh
```

## Test Files

- **Unit Tests**: `src/test/java/**/*Test.java` (runs in TEST phase)
- **Integration Tests**: `src/test/java/**/*IT.java` (runs in VERIFY phase)

## Configured Plugins

✅ **maven-enforcer-plugin** - Validates Maven/Java versions  
✅ **maven-compiler-plugin** - Compiles Java source code  
✅ **maven-surefire-plugin** - Runs unit tests  
✅ **maven-jar-plugin** - Creates JAR with manifest  
✅ **maven-failsafe-plugin** - Runs integration tests  
✅ **maven-install-plugin** - Installs to local repo  
✅ **maven-deploy-plugin** - Deploys to remote repo  

📖 **See [MAVEN_LIFECYCLE.md](MAVEN_LIFECYCLE.md) for detailed documentation**

---

# 1️⃣2️⃣ Full Quick Setup Script (Amazon Linux)

Run everything in **one go**:

```bash
sudo yum update -y

sudo yum install java-17-amazon-corretto -y

sudo yum install maven -y

java -version
mvn -version

mvn archetype:generate \
-DgroupId=com.example \
-DartifactId=hello-maven \
-DarchetypeArtifactId=maven-archetype-quickstart \
-DinteractiveMode=false

cd hello-maven

mvn compile

java -cp target/classes com.example.App
```

---

# 1️⃣3️⃣ DevOps Real Example (CI/CD Pipeline)

Typical pipeline used in **AWS DevOps projects**:

```
GitHub
   │
   ▼
Jenkins
   │
   ▼
Maven Build
   │
   ▼
JUnit Tests
   │
   ▼
Docker Image Build
   │
   ▼
Push to ECR
   │
   ▼
Deploy to EKS / Kubernetes
```
