resource "aws_iam_role" "secret" {
  name = "${var.env}-${var.eks_name}-secret-manager"

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
          "${aws_iam_openid_connect_provider.eks.url}:sub" = "system:serviceaccount:eks:${var.env}-secret-sa"
          "${aws_iam_openid_connect_provider.eks.url}:aud" = "sts.amazonaws.com"
        }
      }
    }]
  })
}

resource "aws_iam_role_policy" "secret" {
  name = "${var.env}-${var.eks_name}-irsa-policy"
  role = aws_iam_role.secret.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "secretsmanager:GetSecretValue"
      ],
      Resource = "arn:aws:secretsmanager:${var.region}:${var.account_id}:secret:/app/${var.env}/kube-credentials"
    }]
  })
}

resource "kubernetes_service_account" "secret" {
  metadata {
    name      = "${var.env}-secret-sa"
    namespace = var.env
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.secret.arn
    }
  }
}
