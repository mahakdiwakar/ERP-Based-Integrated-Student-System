import os
import requests
import time
from pathlib import Path
from dotenv import load_dotenv

# Find and load .env.local
env_path = Path(__file__).resolve().parent.parent / '.env.local'
load_dotenv(dotenv_path=env_path)

BASE_URL = os.getenv("INSFORGE_URL")
API_KEY = os.getenv("INSFORGE_API_KEY")

# Create a shared Session for HTTP connection pooling (Keep-Alive)
session = requests.Session()

if not BASE_URL or not API_KEY:
    print("Warning: INSFORGE_URL and INSFORGE_API_KEY must be set in .env.local")

class QueryBuilder:
    def __init__(self, table):
        self.table = table
        self.params = {}
        self.headers = {
            "Authorization": f"Bearer {API_KEY}",
            "Content-Type": "application/json"
        }
        self.single_requested = False
        self.maybe_single_requested = False
        self.method = "GET"
        self.body = None

    def select(self, columns="*"):
        self.params["select"] = columns
        return self

    def eq(self, column, value):
        self.params[column] = f"eq.{value}"
        return self

    def neq(self, column, value):
        self.params[column] = f"neq.{value}"
        return self

    def in_(self, column, values):
        val_str = ",".join(map(str, values))
        self.params[column] = f"in.({val_str})"
        return self

    def order(self, column, ascending=True):
        direction = "asc" if ascending else "desc"
        self.params["order"] = f"{column}.{direction}"
        return self

    def limit(self, count):
        self.params["limit"] = count
        return self

    def single(self):
        self.single_requested = True
        self.headers["Accept"] = "application/vnd.pgrst.object+json"
        return self

    def maybe_single(self):
        self.maybe_single_requested = True
        self.headers["Accept"] = "application/vnd.pgrst.object+json"
        return self

    def insert(self, data):
        self.method = "POST"
        self.body = data
        return self

    def upsert(self, data, on_conflict=None):
        self.method = "UPSERT"
        self.body = data
        if on_conflict:
            self.params["on_conflict"] = on_conflict
        return self

    def update(self, data):
        self.method = "PATCH"
        self.body = data
        return self

    def delete(self):
        self.method = "DELETE"
        return self

    def execute(self):
        start_time = time.time()
        # Format the endpoint url
        url = f"{BASE_URL}/api/database/records/{self.table}"
        
        if self.method == "GET":
            response = session.get(url, headers=self.headers, params=self.params)
        elif self.method == "POST":
            self.headers["Prefer"] = "return=representation"
            # PostgREST expects a list of objects for insertion
            body = self.body
            if not isinstance(body, list):
                body = [body]
            response = session.post(url, json=body, headers=self.headers, params=self.params)
        elif self.method == "UPSERT":
            self.headers["Prefer"] = "resolution=merge-duplicates,return=representation"
            body = self.body
            if not isinstance(body, list):
                body = [body]
            response = session.post(url, json=body, headers=self.headers, params=self.params)
        elif self.method == "PATCH":
            self.headers["Prefer"] = "return=representation"
            response = session.patch(url, json=self.body, headers=self.headers, params=self.params)
        elif self.method == "DELETE":
            self.headers["Prefer"] = "return=representation"
            response = session.delete(url, headers=self.headers, params=self.params)
        else:
            raise ValueError(f"Unsupported HTTP method: {self.method}")

        duration = (time.time() - start_time) * 1000
        print(f"[PERF] DB {self.method} {self.table} took {duration:.2f}ms (select={self.params.get('select', '*')})")
        return self._handle_response(response)

    def _handle_response(self, response):
        # Handle error status codes
        if response.status_code >= 400:
            try:
                err_json = response.json()
                if err_json.get("code") == "PGRST116":
                    if self.maybe_single_requested:
                        return {"data": None, "error": None}
                    else:
                        return {"data": None, "error": {"message": "No rows returned", "code": "PGRST116"}}
                msg = err_json.get("message", response.text)
            except Exception:
                msg = response.text
            return {"data": None, "error": {"message": msg, "status_code": response.status_code}}
        
        try:
            data = response.json()
        except Exception:
            data = None

        return {"data": data, "error": None}

def from_table(table_name):
    return QueryBuilder(table_name)
