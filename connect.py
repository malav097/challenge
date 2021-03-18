import json
import boto3

def lambda_handler(event, context):
    client = boto3.client("dynamodb")
    client.put_item(TableName="interviewdemo", Item={"connectionid": {"S": event["requestContext"].get("connectionId")}})
    return {
        'statusCode': 200,
        'body': json.dumps('TEST01')
    }