data "aws_iam_policy_document" "website_policy" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    principals {
      identifiers = ["*"]
      type = "AWS"
    }
    resources = [
      "arn:aws:s3:::demo003/*"
    ]
  }
}




resource "aws_s3_bucket" "website_bucket" {
  bucket = "demo003"
  acl = "public-read"
  policy = data.aws_iam_policy_document.website_policy.json
  website {
    index_document = "index.html"
    error_document = "index.html"
  }

}

data "aws_iam_policy_document" "website_websocket_policy" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    principals {
      identifiers = ["*"]
      type = "AWS"
    }
    resources = [
      "arn:aws:s3:::demowebsocket/*"
    ]
  }
}

resource "aws_s3_bucket" "website_websocket" {
  bucket = "demowebsocket"
  acl = "public-read"
  policy = data.aws_iam_policy_document.website_websocket_policy.json
  website {
    index_document = "index.html"
    error_document = "index.html"
  }

}