require 'cfndsl'

CloudFormation do
  Description 'Create multiple S3 Buckets from a specified parameter'

  Parameter(:S3BucketName) do
    Description 'The name of the S3 bucket to Create'
    Type String
  end

  # As we are using a programming language, we can use features such as
  # variables & loops!
  buckets = 3
  buckets.times do |i|
    # We can ommit AWS_, we can even omit S3_ if 'Bucket' is unique
    # Creates a resource named 'S3BucketX'
    S3_Bucket("S3Bucket#{i}") do
      BucketName FnJoin('', [Ref(:S3BucketName), i])
    end
  end

  buckets.times do |i|
    Output("S3BucketArn#{i}") do
      Description "S3 Bucket#{i} ARN"
      Value FnGetAtt("S3Bucket#{i}", 'Arn')
    end
  end
end
