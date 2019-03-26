#!/bin/sh
set -e
cd spring-gitrepo
gradle --no-daemon build
cp build/libs/*.jar ../build-jar/