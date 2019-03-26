#!/bin/sh
set -e
cd spring-gitrepo
ls -la
gradle --no-daemon build
cp build/libs/*.jar /build-jar/