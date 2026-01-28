resource "aws_iam_user" "cms002" {
 name = "Pshah"
}

resource "aws_iam_policy" "cms001policy" {
 policy = file("cms001policy.json")
}

resource "aws_iam_user_policy_attachment" "pshah-admin-access" {
 user = aws_iam_user.cms002.name
 policy_arn = aws_iam_policy.cms001policy.arn
}


