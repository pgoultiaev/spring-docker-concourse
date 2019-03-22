#!/bin/sh
set -e
spring-gitrepo/gradlew --no-daemon --build-file spring-gitrepo/build.gradle build -x test
cp spring-boot-concourse/build/libs/*.jar build-output/