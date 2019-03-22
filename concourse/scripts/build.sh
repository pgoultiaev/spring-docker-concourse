#!/bin/sh
set -e
spring-gitrepo/gradlew --no-daemon --build-file spring-gitrepo/build.gradle build -x test
cp spring-gitrepo/build/libs/*.jar build-output/