# spring-docker-concourse [WIP]

**GIVEN** an app with a stack consisting of
    - spring boot
    - gradle
    - cucumber
<br>**WHEN** a commit is pushed
<br>**THEN** the pipeline should
- build a docker image
- use a versioning strategy that
    - allows every commit to go to production
    - minimises manual versioning work
    - allows Devs to easily track a built   Docker image to its revision in git

The idea is to implement this in [concourse-ci](https://concourse-ci.org/)
