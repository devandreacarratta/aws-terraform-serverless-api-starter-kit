import json
import boto3
import os
from decimal import Decimal

DYNAMODB_TABLE = os.getenv("DYNAMODB_TABLE", "Orders")

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(DYNAMODB_TABLE)


def convert_decimals(obj):
    if isinstance(obj, Decimal):
        return float(obj) 
    elif isinstance(obj, dict):
        return {k: convert_decimals(v) for k, v in obj.items()}
    elif isinstance(obj, list):
        return [convert_decimals(v) for v in obj]
    return obj

def lambda_handler(event, context):
    try:

        if event.get("requestContext", {}).get("http", {}).get("method") != "GET":
            error_invalid_method=f"Method Not Allowed. Expected: GET, Received: {event.get('requestContext', {}).get('http', {}).get('method', 'UNKNOWN')}"
            raise Exception(error_invalid_method)
            logger.error(error_invalid_method)            
            # return {
            #     "statusCode": 405,
            #     "body": json.dumps({
            #         "message": error_invalid_method
            #     })
            # }

        query_params = event.get("queryStringParameters", {}) or {}
        
        order_id = query_params.get("id") or query_params.get("Id")

        if not order_id:
            error_missing_id="Missing required query parameter: id"
            logger.error("message": error_missing_id)
            raise Exception("message": error_missing_id)
            # return {
            #     "statusCode": 400,
            #     "body": json.dumps({"message": error_missing_id})
            # }

        response = table.get_item(Key={'Id': order_id})

        order = response.get("Item", {})
        order = convert_decimals(order)

        return {
            'statusCode': 200,
            'body': json.dumps(order)
        }

    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"message": "Internal Server Error", "error": str(e)})
        }             