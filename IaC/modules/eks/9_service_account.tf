resource "aws_iam_role" "sa" {
  name = "${var.env}-${var.eks_name}-developer-sa"

  // Trust policy: trust relationship with the OIDC provider to associate service account
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Sid    = "AllowAccountRead"
      Effect = "Allow",
      Principal = {
        Federated = aws_iam_openid_connect_provider.eks.arn
      },
      Action = "sts:AssumeRoleWithWebIdentity",
      Condition = {
        StringEquals = {
          "${aws_iam_openid_connect_provider.eks.url}:sub" = "system:serviceaccount:eks:${var.env}-developer-sa"
          "${aws_iam_openid_connect_provider.eks.url}:aud" = "sts.amazonaws.com"
        }
      }
    }]
  })
}

resource "aws_iam_role_policy" "sa" {
  name = "${var.env}-${var.eks_name}-developer-irsa-policy"
  role = aws_iam_role.sa.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "s3:GetObject",
        "s3:PutObject"
      ],
      Resource = "arn:aws:s3:::${var.env}-${var.eks_name}-bucket/*"
    }]
  })
}

resource "kubernetes_service_account" "sa" {
  metadata {
    name      = "${var.env}-developer-sa"
    namespace = var.env
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.sa.arn
    }
  }
}
