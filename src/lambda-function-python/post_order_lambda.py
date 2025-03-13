import json
import boto3
import os
import uuid
from datetime import datetime, timezone
from decimal import Decimal
import logging

logger = logging.getLogger()
logger.setLevel(logging.ERROR)

DYNAMODB_TABLE = os.getenv("DYNAMODB_TABLE", "Orders")

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(DYNAMODB_TABLE)

def convert_floats(obj):
    if isinstance(obj, float):
        return Decimal(str(obj)) 
    elif isinstance(obj, dict):
        return {k: convert_floats(v) for k, v in obj.items()}
    elif isinstance(obj, list):
        return [convert_floats(v) for v in obj]
    return obj

def lambda_handler(event, context):
    print("Received event:", json.dumps(event, indent=4))
    
    try:

        if event.get("requestContext", {}).get("http", {}).get("method") != "POST":
            error_invalid_method=f"Method Not Allowed. Expected: POST, Received: {event.get('requestContext', {}).get('http', {}).get('method', 'UNKNOWN')}"
            raise Exception(error_invalid_method)
            logger.error(error_invalid_method)
            # return {
            #     "statusCode": 405,
            #     "body": json.dumps({
            #         "message": f"Method Not Allowed. Use POST. Received: {event.get('requestContext', {}).get('http', {}).get('method', 'UNKNOWN')}"
            #     })
            # }

        if "body" not in event or not event["body"]:
            error_missing_body="Body is missing or empty"
            logger.error("message": error_missing_body)
            raise Exception("message": error_missing_body)
            # return {
            #     "statusCode": 400,
            #     "body": json.dumps({"message": error_missing_body})
            # }

        body = json.loads(event["body"])

        if not isinstance(body, dict) or not body:
            return {
                "statusCode": 400,
                "body": json.dumps({"message": "Invalid JSON body"})
            }               

        body.setdefault("Id", str(uuid.uuid4()))

        body.setdefault("createdOn", datetime.now(timezone.utc).isoformat())

        body = convert_floats(body)

        table.put_item(Item=body)

        return {
            "statusCode": 201,
            "body": json.dumps({
                "message": "Order saved successfully",
                "orderId": body["Id"]
            }),
        }

    except json.JSONDecodeError as e:
        return {
            "statusCode": 500,
            "body": json.dumps({
                "message": "Invalid JSON format in request body",
                "error": str(e)
            })
        }

    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"message": "Internal Server Error", "error": str(e)})
        }        