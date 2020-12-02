CarrierWave.configure do |config|

  config.storage    = :aws
  config.aws_bucket = ENV['S3_BUCKET_NAME'] # for AWS-side bucket access permissions config, see section below

  config.aws_credentials = {
    access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region:            'us-east-2', # Required
  }
end