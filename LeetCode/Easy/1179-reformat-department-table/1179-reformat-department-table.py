import pandas as pd

def reformat_table(department: pd.DataFrame) -> pd.DataFrame:
    # Desired month order
    months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]

    # Pivot rows (id) × columns (month) with revenue values
    # SUM is safe even if data could theoretically have multiple rows per (id, month)
    out = (
        department.pivot_table(
            index="id",
            columns="month",
            values="revenue",
            aggfunc="sum"
        )
        .reindex(columns=months)                 # ensure Jan..Dec order and include missing months
        .rename(columns=lambda m: f"{m}_Revenue")# rename to Jan_Revenue, ...
        .reset_index()
    )
    return out
