import pandas as pd


# Load Dataset

df = pd.read_csv("data/Telco-Customer-Churn.csv")

print("Dataset Loaded")
print(df.shape)


# Clean TotalCharges


df["TotalCharges"] = pd.to_numeric(
    df["TotalCharges"],
    errors="coerce"
)


# Create Tenure Groups


df["TenureGroup"] = pd.cut(
    df["tenure"],
    bins=[0, 12, 24, 48, 72],
    labels=["0-12", "13-24", "25-48", "49-72"],
    include_lowest=True
)


# Validation Checks


print("\nMissing Values:")
print(df.isnull().sum())

print("\nData Types:")
print(df.dtypes)

print("\nDataset Shape:")
print(df.shape)


# Save Clean Dataset


df.to_csv(
    "data/telecom_cleaned.csv",
    index=False
)

print("\nClean dataset saved successfully!")