import pandas as pd
from google.cloud import bigquery
from google.oauth2 import service_account

# Authenticate using service account
credentials = service_account.Credentials.from_service_account_file(
    "credentials/service_account.json"
)

client = bigquery.Client(
    credentials=credentials,
    project="my-bigquery-project-458621"
)

# Load cleaned data
df = pd.read_csv("data/telecom_cleaned.csv")

# Destination table
table_id = "my-bigquery-project-458621.telecom_analytics.customer_churn_python"

# Upload
job = client.load_table_from_dataframe(df, table_id)

job.result()

print("Upload Complete!")
print(f"Rows uploaded: {len(df)}")