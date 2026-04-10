import pytest
import pandas as pd
from datetime import datetime

def transform_311_logic(df):
    """
    Python proxy for stg_311_requests.sql logic.
    MAPPING:
    - id -> service_request_id
    - date_created -> created_at
    - type -> request_type
    - ward -> request_ward
    """
    result = pd.DataFrame()
    result['service_request_id'] = df['id']
    result['created_at'] = pd.to_datetime(df['date_created'])
    result['request_type'] = df['type']
    result['request_ward'] = df.get('ward', pd.Series(['Unknown']*len(df))).fillna('Unknown')
    result['processed_at'] = datetime.now()
    return result

def test_311_mapping_parity():
    """Verifies that the 311 refinery logic correctly maps Socrata fields."""
    # Setup Mock Data
    raw_data = pd.DataFrame([
        {
            "id": "311-001", 
            "date_created": "2026-03-15T10:00:00", 
            "type": "Pothole", 
            "ward": "1"
        },
        {
            "id": "311-002", 
            "date_created": "2026-03-20T12:30:00", 
            "type": "Overgrown Grass", 
            "ward": None
        }
    ])
    
    # Execute
    transformed = transform_311_logic(raw_data)
    
    # Verify
    assert len(transformed) == 2
    assert transformed.iloc[0]['service_request_id'] == "311-001"
    assert transformed.iloc[0]['request_type'] == "Pothole"
    assert transformed.iloc[1]['request_ward'] == "Unknown"
    assert isinstance(transformed.iloc[0]['created_at'], pd.Timestamp)
    assert transformed.iloc[0]['created_at'].day == 15
