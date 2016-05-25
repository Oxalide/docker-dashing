# docker-dashing

Build a docker image for Dashing

## Usage

Use the file "build" for build the image:

    bash build

During the build process, a new dashboard is created. Then the content of dashing/ directory is copied in the dashboard directory.

You can add your own dashboard by simply copy the .rb file in the dashing/dashboards/ directory. With this method you can add new widgets, jobs, etc ... You need to copy your content in the dashing/ directory (regarding the dashing directory hierarchy).

## How to use it (Aka how to build my own image)

    git clone https://github.com/Oxalide/docker-dashing.git
    cd docker-dashing
    cp ../../myawesomedash.rb dashing/dashboards/
    cp ../../repeatforallyoudash.rb dashing/dashboards/
    bash build

At the end of the build process, you have a new image called "dashing" with all the needs for running you own instance with you own dashboards.

## How to launch the container 

Here the default options:
 * PORT=80 : Dashing will listen on TCP 80 (inside the container)
 * DASHBOARD=sample : Dashing default dashboard
 * TOKEN=YOUR_AUTH_TOKEN : Dashing default token for REST API

You can change this options when launching the container:

    docker run -d --name "my_dashing" -p 80:8080 -e PORT=8080 -e DASHBOARD=myawesomedash -e TOKEN=d759chmWmsADppJ0 dashing

## Copyright and license

Code and documentation copyright 2016 Oxalide. Code and documentation released under the MIT license.

