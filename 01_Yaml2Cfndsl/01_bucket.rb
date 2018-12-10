# Require the gem cfndsl
require 'cfndsl'

# Start CloudFormation definition
CloudFormation do
  Description 'Create an S3 Bucket from a specified parameter'

  # :varname is a symbol in Ruby, this could also be a 'string'
  Parameter(:S3BucketName) do
    Description 'The name of the S3 bucket to Create'
    Type String
  end

  # This is how we specify AWS::S3::Bucket
  AWS_S3_Bucket(:S3Bucket) do
    BucketName Ref(:S3BucketName)
  end

  Output(:S3BucketArn) do
    Description 'S3 Bucket ARN'
    Value FnGetAtt(:S3Bucket, 'Arn')
  end
end
