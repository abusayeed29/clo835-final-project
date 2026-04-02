import os

os.environ["DBHOST"] = "localhost"
os.environ["DBPORT"] = "3306"
os.environ["DBUSER"] = "root"
os.environ["DBPWD"] = "password"
os.environ["DATABASE"] = "employees"
os.environ["USER_NAME"] = "Test User"

from app import app  # noqa: E402


def test_health():
    client = app.test_client()
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json["status"] == "ok"