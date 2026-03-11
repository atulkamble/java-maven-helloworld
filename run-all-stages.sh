#!/bin/bash

# Maven Lifecycle Stages Execution Script
# This script runs all Maven lifecycle stages with detailed output

echo "========================================"
echo "Maven Lifecycle Stages Execution"
echo "========================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Stage 1: VALIDATE
echo -e "${BLUE}Stage 1: VALIDATE${NC}"
echo "- Validating project structure and requirements..."
mvn validate
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Validation successful${NC}"
else
    echo "✗ Validation failed"
    exit 1
fi
echo ""

# Stage 2: COMPILE
echo -e "${BLUE}Stage 2: COMPILE${NC}"
echo "- Compiling source code..."
mvn compile
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Compilation successful${NC}"
else
    echo "✗ Compilation failed"
    exit 1
fi
echo ""

# Stage 3: TEST
echo -e "${BLUE}Stage 3: TEST${NC}"
echo "- Running unit tests..."
mvn test
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Unit tests passed${NC}"
else
    echo "✗ Unit tests failed"
    exit 1
fi
echo ""

# Stage 4: PACKAGE
echo -e "${BLUE}Stage 4: PACKAGE${NC}"
echo "- Creating JAR package..."
mvn package -DskipTests
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Package created${NC}"
    echo "  JAR location: target/hello-maven-1.0-SNAPSHOT.jar"
else
    echo "✗ Packaging failed"
    exit 1
fi
echo ""

# Stage 5: VERIFY
echo -e "${BLUE}Stage 5: VERIFY${NC}"
echo "- Running integration tests..."
mvn verify -DskipTests
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Integration tests passed${NC}"
else
    echo "✗ Integration tests failed"
    exit 1
fi
echo ""

# Stage 6: INSTALL
echo -e "${BLUE}Stage 6: INSTALL${NC}"
echo "- Installing to local repository..."
mvn install -DskipTests
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Installed to ~/.m2/repository${NC}"
else
    echo "✗ Installation failed"
    exit 1
fi
echo ""

# Stage 7: DEPLOY
echo -e "${BLUE}Stage 7: DEPLOY${NC}"
echo "- Deploying to repository..."
mvn deploy -DskipTests
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Deployed successfully${NC}"
    echo "  Deploy location: target/releases or target/snapshots"
else
    echo "✗ Deployment failed"
    exit 1
fi
echo ""

echo "========================================"
echo -e "${GREEN}All Maven lifecycle stages completed!${NC}"
echo "========================================"
echo ""
echo "To run the application:"
echo "  java -jar target/hello-maven-1.0-SNAPSHOT.jar"
echo "  or"
echo "  mvn exec:java"
