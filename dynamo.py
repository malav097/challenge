import json
import random
import boto3
from boto3.dynamodb.conditions import Key

def lambda_handler(event, context):

    class ResponseRandomizer:

        def __init__(self, res):
            self.res = res

        def randomizer(self):
            Item = self.res['Items']
            Item = random.choice(Item)
            Item = Item['word']

            return Item

    dynamodb = boto3.resource('dynamodb', region_name='us-east-1')
    table = dynamodb.Table('randomobject')  
    response = table.scan()
    randomobject = ResponseRandomizer(response)

    randomobject = randomobject.randomizer()


    return {
        'statusCode': 200,
        'body': json.dumps(randomobject),
        'headers': { 
        }

    }