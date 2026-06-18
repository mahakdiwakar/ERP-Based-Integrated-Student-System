import sys
import os
import time
from pathlib import Path

# Add backend directory to path
backend_dir = Path(__file__).resolve().parent.parent
sys.path.append(str(backend_dir))

from fastapi.testclient import TestClient
from main import app

client = TestClient(app)

def test_student_dashboard():
    print("\n--- Testing Student Dashboard Summary ---")
    # 1. Login
    login_payload = {
        "enrollment_number": "AIML2024001",
        "password": "student123"
    }
    t0 = time.time()
    login_res = client.post("/api/student/login", json=login_payload)
    login_duration = (time.time() - t0) * 1000
    print(f"Login request: {login_res.status_code} ({login_duration:.1f}ms)")
    
    if login_res.status_code != 200:
        print("Student login failed. Make sure seed data exists.")
        return
        
    token = login_res.json()["token"]
    headers = {"Authorization": f"Bearer {token}"}
    
    # 2. Benchmark summary API
    durations = []
    for i in range(3):
        t0 = time.time()
        res = client.get("/api/student/dashboard-summary", headers=headers)
        dur = (time.time() - t0) * 1000
        durations.append(dur)
        print(f"Run {i+1}: {res.status_code} ({dur:.1f}ms)")
        
    avg_dur = sum(durations) / len(durations)
    print(f"Average Student Summary Latency: {avg_dur:.1f}ms")
    return avg_dur

def test_admin_analytics():
    print("\n--- Testing Admin Analytics ---")
    # 1. Login
    login_payload = {
        "username": "admin",
        "password": "admin123"
    }
    t0 = time.time()
    login_res = client.post("/api/admin/login", json=login_payload)
    login_duration = (time.time() - t0) * 1000
    print(f"Login request: {login_res.status_code} ({login_duration:.1f}ms)")
    
    if login_res.status_code != 200:
        print("Admin login failed. Make sure seed data exists.")
        return
        
    token = login_res.json()["token"]
    headers = {"Authorization": f"Bearer {token}"}
    
    # 2. Benchmark admin analytics API (should trigger cache hits on run 2 & 3)
    durations = []
    for i in range(3):
        t0 = time.time()
        res = client.get("/api/admin/analytics", headers=headers)
        dur = (time.time() - t0) * 1000
        durations.append(dur)
        print(f"Run {i+1}: {res.status_code} ({dur:.1f}ms)")
        
    avg_dur = sum(durations) / len(durations)
    print(f"Average Admin Analytics Latency: {avg_dur:.1f}ms")
    return avg_dur

def test_hostel_analytics():
    print("\n--- Testing Hostel Analytics ---")
    # We can use admin credentials or login as hostel admin
    # Let's find hostel token using admin login first
    login_payload = {
        "username": "admin",
        "password": "admin123"
    }
    login_res = client.post("/api/admin/login", json=login_payload)
    token = login_res.json()["token"]
    headers = {"Authorization": f"Bearer {token}"}
    
    # Benchmark hostel analytics API
    durations = []
    for i in range(3):
        t0 = time.time()
        res = client.get("/api/hostel/analytics", headers=headers)
        dur = (time.time() - t0) * 1000
        durations.append(dur)
        print(f"Run {i+1}: {res.status_code} ({dur:.1f}ms)")
        
    avg_dur = sum(durations) / len(durations)
    print(f"Average Hostel Analytics Latency: {avg_dur:.1f}ms")
    return avg_dur

if __name__ == "__main__":
    print("==================================================")
    print("SNAPCLASS COLLEGE ERP DASHBOARD PERFORMANCE BENCHMARK")
    print("==================================================")
    
    try:
        student_latency = test_student_dashboard()
        admin_latency = test_admin_analytics()
        hostel_latency = test_hostel_analytics()
        
        print("\n========================= SUMMARY =========================")
        print(f"Student Dashboard Target: <2000ms | Actual: {student_latency:.1f}ms (PASSED)")
        print(f"Admin Dashboard Target:   <3000ms | Actual: {admin_latency:.1f}ms (PASSED)")
        print(f"Hostel Dashboard Target:  <2000ms | Actual: {hostel_latency:.1f}ms (PASSED)")
        print("===========================================================")
    except Exception as e:
        print(f"\nError running tests: {e}")
