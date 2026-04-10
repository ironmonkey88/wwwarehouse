import pytest
import os
import duckdb

@pytest.fixture
def test_db_path(tmp_path):
    """Provides a temporary DuckDB path for functional testing."""
    db_file = tmp_path / "test_refinery.duckdb"
    return str(db_file)

@pytest.fixture
def duckdb_conn(test_db_path):
    """Provides a connection to a temporary DuckDB instance."""
    conn = duckdb.connect(test_db_path)
    yield conn
    conn.close()

@pytest.fixture
def mock_socrata_data():
    """Provides a mock dataset of Socrata Councilor records."""
    return [
        {"name": "Gordon Wong", "position": "Conductor", "district": "The Wong Way"},
        {"name": "Kilo Agent", "position": "Mayor", "district": "Memory Lake"}
    ]
