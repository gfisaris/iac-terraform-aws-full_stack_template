resource "aws_s3_bucket_object" "app-iam_user_crd" {
  bucket = "${aws_s3_bucket.app.id}"
  key = ".app-iam_user.credentials"
  content = "${template_file.app-iam_user_crd.rendered}"
}

resource "aws_s3_bucket_object" "app-github_repo" {
  bucket = "${aws_s3_bucket.app.id}"
  key = ".app-github.repo"
  content = "${template_file.app-github_repo.rendered}"
}

## Configuration Files for Application vHost

  resource "aws_s3_bucket_object" "vhost-nginx_conf" {
    bucket = "${aws_s3_bucket.app.id}"
    key = "vhost-nginx_conf"
    content = "${template_file.vhost-nginx_conf.rendered}"
  }

  resource "aws_s3_bucket_object" "vhost-phpfpm_conf" {
    bucket = "${aws_s3_bucket.app.id}"
    key = "vhost-phpfpm_conf"
    content = "${template_file.vhost-phpfpm_conf.rendered}"
  }

  resource "aws_s3_bucket_object" "vhost-newrelic_conf" {
    bucket = "${aws_s3_bucket.app.id}"
    key = "vhost-newrelic_conf"
    content = "${template_file.vhost-newrelic_conf.rendered}"
  }

## Configuration Files for Cloudwatch Logs Monitoring Service

  resource "aws_s3_bucket_object" "cloudwatch-allInstances_app_logs_conf" {
    bucket  = "${aws_s3_bucket.app.id}"
    key     = "cloudwatch-allInstances_app_logs_conf"
    content = "${template_file.cloudwatch-allInstances_app_logs_conf.rendered}"
  }

  resource "aws_s3_bucket_object" "cloudwatch-allInstances_gqm_qc_daemons_logs_conf" {
    bucket  = "${aws_s3_bucket.app.id}"
    key     = "cloudwatch-allInstances_gqm_qc_daemons_logs_conf"
    content = "${template_file.cloudwatch-allInstances_gqm_qc_daemons_logs_conf.rendered}"
  }

  resource "aws_s3_bucket_object" "cloudwatch-allInstances_services_logs_conf" {
    bucket  = "${aws_s3_bucket.app.id}"
    key     = "cloudwatch-allInstances_services_logs_conf"
    content = "${template_file.cloudwatch-allInstances_services_logs_conf.rendered}"
  }

  resource "aws_s3_bucket_object" "cloudwatch-allInstances_vhost_logs_conf" {
    bucket  = "${aws_s3_bucket.app.id}"
    key     = "cloudwatch-allInstances_vhost_logs_conf"
    content = "${template_file.cloudwatch-allInstances_vhost_logs_conf.rendered}"
  }
