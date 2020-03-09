# Overview
In this lecture we focus on CI/CD toolset - CodePipeline and Jenkins in particular. We run through the setup of both tools and the usage of both.

# Slides
[Here](http://tiny.cc/nne2kz)

# CI/CD scenario
## Overview
1. Golang web app that would have a simple test suite 
2. The app should be containerized
3. The code for the app will be hosted on github
4. The pipleline should consist of two parts

    4.1 A **CI** part where the code is being build and tested.
    An image artifact is stored

    4.2 A **CD** part. The deployment should be Blue/Green.
5. The app should run in an ECS cluster. 



