docker-buildslave
================= 

Docker image usable for running a buildbot slave

Usage
-----

*IMPORTANT:* Update Dockerfile to match the buildmaster parameters

This creates a docker image for running a buildslave.

To remove all the existing containers:

    $ sudo docker rm $(sudo docker ps -a -q)

To remove all the existing images:

    $ sudo docker rmi $(sudo docker images -q)

To set up the container:

    $ sudo docker build -no-cache --rm=true -t buildslave .
    $ sudo docker run -d buildslave buildslave start --nodaemon slave

