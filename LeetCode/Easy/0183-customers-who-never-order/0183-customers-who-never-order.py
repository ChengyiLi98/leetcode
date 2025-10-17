import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    # Merge customers with orders on matching customer id
    merged = customers.merge(orders, left_on='id', right_on='customerId', how='left')
    
    # Keep only customers where order id is NaN (meaning no order found)
    result = merged[merged['id_y'].isna()][['name']]
    
    # Rename the column to match expected output
    result.columns = ['Customers']
    return result
    