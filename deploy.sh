#!/bin/bash

# Deploy Docker image to a server 
docker save reactjs-app-web | ssh -i /home/ubuntu/Deploy.pem ubuntu@ec2-3-108-215-180.ap-south-1.compute.amazonaws.com 'docker load && docker run -p 80:80 reactjs-app-web'

