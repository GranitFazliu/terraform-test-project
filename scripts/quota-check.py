import os
import requests
from azure.identity import ClientSecretCredential

# Environment variables
tenant_id = os.getenv('ARM_TENANT_ID')
client_id = os.getenv('ARM_CLIENT_ID')
client_secret = os.getenv('ARM_CLIENT_SECRET')
subscription_id = os.getenv('ARM_SUBSCRIPTION_ID')

# Authenticate
credential = ClientSecretCredential(tenant_id=tenant_id, client_id=client_id, client_secret=client_secret)
token = credential.get_token("https://management.azure.com/.default").token

# Azure Management URL for Quotas (using a supported API version)
url = f"https://management.azure.com/subscriptions/{subscription_id}/providers/Microsoft.Compute/locations/eastus/serviceLimits?api-version=2020-10-25"

# Headers
headers = {
    'Authorization': f'Bearer {token}',
    'Content-Type': 'application/json'
}

# Make the request
response = requests.get(url, headers=headers)
if response.status_code == 200:
    quotas = response.json()
    print(quotas)
else:
    print(f"Failed to retrieve quotas: {response.text}")
