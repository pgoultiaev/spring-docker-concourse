#!/bin/sh
set -e

ls -la
cd spring-gitrepo
./gradlew --no-daemon test