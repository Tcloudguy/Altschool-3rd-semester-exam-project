#!/usr/bin/env groovy

pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "eu-west-3"
    }
    stages {
        stage("Creating an EKS Cluster") {
            steps {
                script {
                    dir('eks-cluster') {
                        sh "terraform  destroy  --auto-approve"
                    }
                }
            }
        }
    }
}
