# Maven Lifecycle Stages

This project is configured with all Maven lifecycle stages. Here's how to run each stage:

## Maven Lifecycle Phases

Maven follows a specific lifecycle with the following phases:

### 1. **VALIDATE** 
Validates the project is correct and all necessary information is available.
```bash
mvn validate
```
- Checks Maven and Java versions (must be Maven 3.6.0+ and Java 21+)
- Validates POM structure

### 2. **COMPILE**
Compiles the source code of the project.
```bash
mvn compile
```
- Compiles Java source files in `src/main/java`
- Outputs to `target/classes`

### 3. **TEST**
Tests the compiled source code using unit tests.
```bash
mvn test
```
- Runs unit tests (files ending with `*Test.java`)
- Uses maven-surefire-plugin
- Generates test reports in `target/surefire-reports`

### 4. **PACKAGE**
Packages the compiled code into a distributable format (JAR).
```bash
mvn package
```
- Creates JAR file in `target/` directory
- JAR includes manifest with main class
- Filename: `hello-maven-1.0-SNAPSHOT.jar`

### 5. **VERIFY**
Runs integration tests and checks quality criteria.
```bash
mvn verify
```
- Runs integration tests (files ending with `*IT.java`)
- Uses maven-failsafe-plugin
- Verifies the package meets quality standards

### 6. **INSTALL**
Installs the package into the local Maven repository.
```bash
mvn install
```
- Copies JAR to `~/.m2/repository`
- Makes it available as a dependency for other local projects

### 7. **DEPLOY**
Deploys the package to a remote repository.
```bash
mvn deploy
```
- Deploys to configured repository
- Currently configured to deploy to `target/releases` or `target/snapshots`
- In production, configure this for your artifact repository (Nexus, Artifactory, etc.)

## Run All Stages

To run all lifecycle stages in sequence:
```bash
mvn clean deploy
```

This single command executes all phases in order:
1. clean (removes target directory)
2. validate
3. compile
4. test
5. package
6. verify
7. install
8. deploy

## Run the Application

After packaging, run the application:
```bash
java -jar target/hello-maven-1.0-SNAPSHOT.jar
```

Or use the exec plugin:
```bash
mvn exec:java
```

## Skip Stages (Optional)

Skip tests during build:
```bash
mvn package -DskipTests
```

Skip integration tests only:
```bash
mvn verify -DskipITs
```

## Configured Plugins

| Phase    | Plugin                      | Purpose                              |
|----------|-----------------------------|--------------------------------------|
| validate | maven-enforcer-plugin       | Enforce Maven/Java versions          |
| compile  | maven-compiler-plugin       | Compile Java source code             |
| test     | maven-surefire-plugin       | Run unit tests                       |
| package  | maven-jar-plugin            | Create JAR with manifest             |
| verify   | maven-failsafe-plugin       | Run integration tests                |
| install  | maven-install-plugin        | Install to local repository          |
| deploy   | maven-deploy-plugin         | Deploy to remote repository          |

## Test Files

- **Unit Tests**: `*Test.java` (run during TEST phase)
  - Example: `AppTest.java`
  
- **Integration Tests**: `*IT.java` (run during VERIFY phase)
  - Example: `AppIT.java`

## Build Output

```
target/
├── classes/                          # Compiled classes (COMPILE)
├── test-classes/                     # Compiled test classes (TEST)
├── surefire-reports/                 # Unit test reports (TEST)
├── failsafe-reports/                 # Integration test reports (VERIFY)
├── hello-maven-1.0-SNAPSHOT.jar      # Packaged JAR (PACKAGE)
├── releases/                         # Deploy location for releases (DEPLOY)
└── snapshots/                        # Deploy location for snapshots (DEPLOY)
```

## Best Practices

1. Always run `mvn clean` before a full build to ensure a fresh state
2. Run `mvn verify` before committing code to ensure all tests pass
3. Use `mvn install` when developing multiple local projects that depend on each other
4. Configure proper repository URLs in `<distributionManagement>` for production deployments
