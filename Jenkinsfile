#!/usr/bin/env groovy

pipeline {

    agent any

    environment {

        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')

        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')

        AWS_DEFAULT_REGION = "eu-west-3"

    }

    stages {

        stage("Create an EKS Cluster") {

            steps {

                script {

                    dir('NCUK-EKS-Cluster-Preprod/terraform-for-cluster') {

                        sh "terraform init -reconfigure"

                        sh "terraform apply -auto-approve"

                    }

                }

            }

        }

        stage("Deploy to EKS") {

            steps {

                script {

                    dir('NCUK-EKS-Cluster-Preprod/kubernetes') {

                        sh "aws eks update-kubeconfig --name NCUK-EKS-Cluster-Preprod"

                        sh "kubectl apply -f deployment.yaml"

                        sh "kubectl apply -f service.yaml"

                    }

                }

            }

        }

    }

}