# 01_Yaml2Cfndsl
The examples in this folder are a extremely simple way to use CFNDSL for generating your templates. It will take you through the basics of some of the CFNDSL commands as well as showing a 1-to-1 conversion from a yaml template to a CFNDSL template

## Guide
You should read each section in this README and look at and compare the files

## Testing CFNDSL
Run the following command to generate a JSON template
```
cfndsl -b 01_bucket.rb
```
```
{"AWSTemplateFormatVersion":"2010-09-09","Description":"Create an S3 Bucket from a specified parameter","Parameters":{"S3BucketName":{"Type":"String","Description":"The name of the S3 bucket to Create"}},"Resources":{"S3Bucket":{"Type":"AWS::S3::Bucket","Properties":{"BucketName":{"Ref":"S3BucketName"}}}},"Outputs":{"S3BucketArn":{"Description":"S3 Bucket ARN","Value":{"Fn::GetAtt":["S3Bucket","Arn"]}}}}
```
Check the CFNDSL repo for arguments, for now we will be running this command to generate a YAML template
```
cfndsl -b -f yaml 01_bucket.rb
```
```
---
AWSTemplateFormatVersion: '2010-09-09'
Description: Create an S3 Bucket from a specified parameter
Parameters:
  S3BucketName:
    Type: String
    Description: The name of the S3 bucket to Create
Resources:
  S3Bucket:
    Type: AWS::S3::Bucket
    Properties:
      BucketName:
        Ref: S3BucketName
Outputs:
  S3BucketArn:
    Description: S3 Bucket ARN
    Value:
      Fn::GetAtt:
      - S3Bucket
      - Arn
```

## 01_bucket
An S3 bucket. Note that a top level key is not required to identify parameters, resources, etc

## 02_bucket_multi
Create multiple S3 buckets. See here one of the first benefits of using CFNDSL, you can use programming concepts to generate CloudFormation such as variables and loops
