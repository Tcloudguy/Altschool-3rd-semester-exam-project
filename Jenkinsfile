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
                        sh "terraform init"
                        sh "terraform apply --auto-approve"
                    }
                }
            }
        }
        stage("Deploying sock-shop-app microservice, webpage and a Monitoring system to EKS") {
            steps {
                script {
                    dir('k8s') {
                        sh "aws eks --region eu-west-3 update-kubeconfig --name cicd-cluster"
                        sh "kubectl create -f sock-shop-app/"
                        sh "kubectl create -f myweb-page/"
                        sh "kubectl create -f monitoring-stack"
                    }
                }
            }
        }
    }
}
