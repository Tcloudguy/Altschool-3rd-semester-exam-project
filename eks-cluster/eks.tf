resource "aws_iam_role" "cicd-cluster" {
  name = "eks-cluster-cicd-cluster"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "cicd-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cicd-cluster.name
}

resource "aws_eks_cluster" "cicd-cluster" {
  name     = "cicd-cluster"
  role_arn = aws_iam_role.cicd-cluster.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-eu-west-3a.id,
      aws_subnet.private-eu-west-1b.id,
      aws_subnet.public-eu-west-3a.id,
      aws_subnet.public-eu-west-3b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.cicd-cluster-AmazonEKSClusterPolicy]
}
