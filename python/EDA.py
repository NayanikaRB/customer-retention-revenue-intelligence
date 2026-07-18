import pandas as pd

df = pd.read_csv("data/Telco-Customer-Churn.csv")

print(df.head())
print(df.shape)
print(df.columns.tolist())
df.info()
df.isnull().sum()
print(df.dtypes)
print(df["TotalCharges"].head(20))
print((df["TotalCharges"] == " ").sum())
print(df["TotalCharges"].unique()[:50])
print(df[df["TotalCharges"] == " "])
blank_rows = df[df["TotalCharges"] == " "]

for col in df.columns:
    print(col, blank_rows[col].nunique())

for col in df.columns:
    if blank_rows[col].nunique() == 1:
        print(col, blank_rows[col].unique())

print(df[df["TotalCharges"] == " "][["customerID","tenure","MonthlyCharges","TotalCharges"]])

df["TotalCharges"] = pd.to_numeric(df["TotalCharges"], errors="coerce")

print(df["TotalCharges"].dtype)
print(df["TotalCharges"].isnull().sum())

print(df.describe())

# Churn Analysis

print(df["Churn"].value_counts())

print("\nChurn Percentage:")
print(round(df["Churn"].value_counts(normalize=True) * 100, 2))

contract_churn = pd.crosstab(
    df["Contract"],
    df["Churn"],
    normalize="index"
) * 100

print(contract_churn)

print(
    df.groupby("Churn")["tenure"]
      .agg(["count","mean","median","min","max"])
)

print(
    df.groupby("Churn")["MonthlyCharges"]
      .agg(["count","mean","median","min","max"])
)

#Customers who churn pay significantly higher monthly charges than retained customers. 
# The average monthly charge for churned customers is $74.44 compared to $61.27 for retained customers. 
# This suggests pricing, plan value perception, or service mix may contribute to customer attrition.

# Tech Support vs Churn

techsupport_churn = pd.crosstab(
    df["TechSupport"],
    df["Churn"],
    normalize="index"
) * 100

print(techsupport_churn)

#Customers without internet service exhibit the lowest churn rate (7.4%). 
#However, this segment likely represents a different customer population with 
#fewer services and potentially lower revenue contribution. 
#Further analysis is needed to compare churn and revenue simultaneously before drawing business conclusions.

print(
    pd.crosstab(
        df["InternetService"],
        df["Churn"],
        normalize="index"
    ) * 100
)

print(
    pd.crosstab(
        df["PaymentMethod"],
        df["Churn"],
        normalize="index"
    ) * 100
)

df["TenureGroup"] = pd.cut(
    df["tenure"],
    bins=[0,12,24,48,72],
    labels=["0-12","13-24","25-48","49-72"]
)

print(
    pd.crosstab(
        df["TenureGroup"],
        df["Churn"],
        normalize="index"
    ) * 100
)

print("""
1. Overall Churn Rate = 26.54%

2. Month-to-month customers have the highest churn rate (42.71%).

3. Customers in their first year have the highest churn rate (47.68%).

4. Churned customers have lower tenure (median = 10 months).

5. Churned customers pay higher monthly charges ($74.44 vs $61.27).

6. Fiber optic customers churn more (41.89%).

7. Customers without Tech Support churn much more (41.64%).

8. Electronic check customers have the highest churn rate (45.29%).

9. TotalCharges contained 11 hidden missing values, all belonging to tenure=0 customers.
""")