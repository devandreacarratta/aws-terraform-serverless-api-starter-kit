# AWS Terraform Serverless API Starter Kit

## Overview
This repository provides a **minimal serverless architecture** as a **case study** using **Terraform** on **AWS**. It simulates **order processing** with AWS **Lambda Function URLs** for handling API requests and **DynamoDB** for data storage.

## Features
- **Infrastructure as Code (IaC)**: Uses **Terraform** to provision and manage AWS resources.
- **Serverless API**: Implements **AWS Lambda Function URLs** for `GET` and `POST` operations.
- **DynamoDB Integration**: Stores order data in a **fully managed NoSQL database**.
- **IAM Policies**: Secures Lambda functions with the **least privilege principle**.
- **CloudWatch Logging**: Enables logging for monitoring and debugging.
- **Modular Design**: Organizes Terraform into reusable modules.

## Architecture
```
(Client) → [Lambda Function URL] → [AWS Lambda] → [DynamoDB]
```
- **POST /orders**: Submits a new order.
- **GET /orders?id=xyz**: Retrieves an order by ID.

## Repository Structure
```
aws-terraform-serverless-api-starter-kit/
│── examples/                     # Example request payloads
│── src/
│   ├── infra/                     # Terraform infrastructure code
│   │   ├── variables/              # Environment-specific variables
│   │   ├── main_cloudwatch.tf      # CloudWatch logging configuration
│   │   ├── main_dynamodb.tf        # DynamoDB table definition
│   │   ├── main_iam_role_policy.tf # IAM roles and policies
│   │   ├── main_lambda_function_url.tf # Lambda Function URLs
│   │   ├── main_lambda.tf          # Lambda functions
│   │   ├── provider.tf             # AWS provider configuration
│   │   ├── variables.tf            # Terraform variable definitions
│   │
│   ├── infra-modules/              # Reusable Terraform modules
│   │   ├── cloudwatch_log_group
│   │   ├── dynamodb_table
│   │   ├── iam_role_policy
│   │   ├── lambda_function
│   │   ├── lambda_function_url
│   │
│   ├── lambda-function-python/     # Python Lambda source code
│   │   ├── get_order_lambda.py     # GET order Lambda function
│   │   ├── post_order_lambda.py    # POST order Lambda function
│   │
│   ├── lambda-function-python-zip/ # Packaged Lambda functions
│   │   ├── get_order_lambda.zip
│   │   ├── post_order_lambda.zip
│
│── .gitignore
│── LICENSE (MIT)
│── README.md
```

## Deployment
### **Prerequisites**
- Install **Terraform**
- Configure **AWS CLI** (`aws configure`)

### **Steps**
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/aws-terraform-serverless-api-starter-kit.git
   cd aws-terraform-serverless-api-starter-kit/src/infra
   ```

2. Initialize Terraform:
   ```sh
   terraform init
   ```

3. Plan the infrastructure:
   ```sh
   terraform plan -var-file=variables/dev.tfvars
   ```

4. Apply changes:
   ```sh
   terraform apply -var-file=variables/dev.tfvars
   ```

## API Usage
### **POST /orders**
Submit an order:
```sh
curl -X POST "https://your-lambda-url/orders" \
     -H "Content-Type: application/json" \
     -d '{ "CustomerId": "CUST-5678", "products": [{"quantity": 1, "single_price": 99.9}] }'
```

### **GET /orders?id=xyz**
Retrieve an order:
```sh
curl -X GET "https://your-lambda-url/orders?id=xyz"
```

## Future Enhancements  
Stay tuned! This project will be extended with new features and improvements, making it an even more complete serverless case study. 🚀  

## License
This project is licensed under the **MIT License**. Use at your own risk. If something breaks, **it's your problem!** 😆

---
🚀 Happy Coding!

