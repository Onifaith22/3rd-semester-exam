resource "aws_iam_role" "k8-cluster" {
  name = "eks-cluster-k8-cluster"

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

resource "aws_iam_role_policy_attachment" "k8-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.k8-cluster.name
}

resource "aws_eks_cluster" "k8-cluster" {
  name     = "k8-cluster"
  role_arn = aws_iam_role.k8-cluster.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-us-east-2a.id,
      aws_subnet.private-us-east-2b.id,
      aws_subnet.public-us-east-2a.id,
      aws_subnet.public-us-east-2b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.k8-cluster-AmazonEKSClusterPolicy]
}
