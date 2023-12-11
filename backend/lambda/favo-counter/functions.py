import boto3

client = boto3.client('dynamodb')
response = client.list_tables()