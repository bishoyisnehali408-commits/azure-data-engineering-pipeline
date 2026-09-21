import pandas as pd


def validate_data(file_path):
    """Run basic data-quality checks on a CSV file."""

    df = pd.read_csv(file_path)

    print("========== DATA VALIDATION ==========")

    # Record count
    print(f"Total records: {len(df)}")

    # Column names
    print("\nColumns:")
    print(df.columns.tolist())

    # Missing values
    print("\nMissing values:")
    print(df.isnull().sum())

    # Duplicate records
    print("\nDuplicate records:")
    print(df.duplicated().sum())

    # Data types
    print("\nData types:")
    print(df.dtypes)

    print("\n========== VALIDATION COMPLETE ==========")


if __name__ == "__main__":
    validate_data("sample_data/customers.csv")
