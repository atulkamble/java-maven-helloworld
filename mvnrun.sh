#!/bin/bash
# Wrapper script to enable 'mvn run' functionality
# Usage: ./mvnrun.sh or set alias: alias mvnrun='./mvnrun.sh'

echo "🚀 Running Maven application..."
mvn compile exec:java
