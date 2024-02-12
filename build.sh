#!/bin/bash

docker build -t react-app .
docker tag react-app joshuajoz123867/prod:capstone

