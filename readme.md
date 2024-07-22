# Terraform and Localstack
Step by step to use `Terraform` in `Localstack`.

## Run Localstack with docker-compose
In this repository go to localstack folder and run:
```bash
docker-compose up
```

## Configuring Localstack
With aws-cli installed add a new profile and credentials to use localstack.
In the `.aws/` folder:
- Change the `config` file to:
```text
[profile localstack]
region = us-east-1
output = json
endpoint_url = http://localhost:4566
```
- Change the `credentials` file to:
```text
[localstack]
aws_access_key_id = test
aws_secret_access_key = test
```

## Testing Localstack:
- Listing buckets: 
```bash
aws s3 ls --profile localstack
```
- Creating a bucket:
```bash
aws s3 mb s3://test-bucket --profile localstack
```
- Uploading a file to S3:
```bash
aws s3 cp files/test.txt s3://test-bucket --profile localstack
```
- Listing bucket files:
```bash
aws s3 ls s3://test-bucket --profile localstack
```

## Running Terraform
In `repo-example/main` run this:
- To init, download providers and configs.
```bash
terraform init
```
- To plan.
```bash
terraform plan
```
- To apply.
```bash
terraform apply
```
- To destroy.
```bash
terraform destroy
```


## To test the infraestructure:
```bash
aws ec2 describe-network-interfaces --profile localstack
```