pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = "AKIA4VVG6SZZI7VSLBIC"
        AWS_SECRET_ACCESS_KEY = "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"
        AWS_DEFAULT_REGION = "eu-west-3"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('NCUK-EKS-Cluster-Preprod/terraform-for-cluster') {
                        sh "terraform init"
                        sh "terraform validate"
                        sh "terraform plan"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('NCUK-EKS-Cluster-Preprod/kubernetes') {
                        sh "aws eks update-kubeconfig --name NCUK-EKS-Cluster-Preprod --region eu-west-3"
                        sh "kubectl apply -f deployment.yaml"
                        sh "kubectl apply -f service.yaml"
                    }
                }
            }
        }
    }
}