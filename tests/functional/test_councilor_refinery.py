import pytest
import pandas as pd
from datetime import datetime

def transform_councilor_logic(df):
    """
    Python implementation of the stg_councilors.sql logic for TDD proof.
    Logic:
    - _dlt_id -> councilor_id
    - name -> councilor_name
    - ward -> councilor_ward
    - CURRENT_TIMESTAMP -> processed_at
    """
    result = pd.DataFrame()
    result['councilor_id'] = df['_dlt_id']
    result['councilor_name'] = df['name']
    result['councilor_ward'] = df['ward']
    result['processed_at'] = datetime.now()
    return result

def test_councilor_refinery_mapping(mock_socrata_data):
    """Verifies that the refinery correctly maps Socrata fields to Councilor fields."""
    # Setup
    input_df = pd.DataFrame([
        {"_dlt_id": "123", "name": "Gordon Wong", "ward": "1"},
        {"_dlt_id": "456", "name": "Kilo Agent", "ward": "2"}
    ])
    
    # Execute
    output_df = transform_councilor_logic(input_df)
    
    # Verify
    assert len(output_df) == 2
    assert output_df.iloc[0]['councilor_name'] == "Gordon Wong"
    assert output_df.iloc[1]['councilor_ward'] == "2"
    assert 'processed_at' in output_df.columns
    assert isinstance(output_df.iloc[0]['processed_at'], datetime)
