"""Bulk demo student generation for FastAPI."""

from auth_utils import hash_password
from db_helper import from_table

DEMO_PASSWORD = "student123"
STUDENTS_PER_CLASS = 50
TOTAL_DEMO_STUDENTS = 300
DEMO_META_KEY = "demo_students_300"

CLASS_PLAN = [
    {"class_name": "AIML-A", "dept_code": "AIML", "prefix": "AIML", "start_num": 1},
    {"class_name": "AIML-B", "dept_code": "AIML", "prefix": "AIML", "start_num": 51},
    {"class_name": "AIML-C", "dept_code": "AIML", "prefix": "AIML", "start_num": 101},
    {"class_name": "CYBER-A", "dept_code": "CYBER", "prefix": "CYBER", "start_num": 1},
    {"class_name": "CYBER-B", "dept_code": "CYBER", "prefix": "CYBER", "start_num": 51},
    {"class_name": "CYBER-C", "dept_code": "CYBER", "prefix": "CYBER", "start_num": 101},
]

FIRST_NAMES = [
    "Aarav", "Vihaan", "Aditya", "Arjun", "Reyansh", "Sai", "Arnav", "Ayaan", "Krishna", "Ishaan",
    "Shaurya", "Atharv", "Advik", "Pranav", "Dhruv", "Kabir", "Ritvik", "Aarush", "Veer", "Rohan",
    "Vivaan", "Kian", "Darsh", "Yash", "Dev", "Aryan", "Rudra", "Om", "Parth", "Harsh",
    "Ananya", "Diya", "Aadhya", "Pari", "Anika", "Navya", "Myra", "Ira", "Avni", "Riya",
    "Shanaya", "Siya", "Priya", "Kavya", "Ishita", "Kiara", "Nisha", "Meera", "Tanvi", "Pooja",
    "Neha", "Lakshmi", "Sneha", "Divya", "Swati", "Anjali", "Shruti", "Deepika", "Kritika", "Sakshi",
]

LAST_NAMES = [
    "Sharma", "Verma", "Patel", "Singh", "Kumar", "Reddy", "Nair", "Iyer", "Gupta", "Joshi",
    "Mehta", "Shah", "Rao", "Menon", "Pillai", "Choudhary", "Agarwal", "Banerjee", "Das", "Ghosh",
    "Kulkarni", "Desai", "Hegde", "Malhotra", "Kapoor", "Saxena", "Trivedi", "Mishra", "Pandey", "Sinha",
    "Bhat", "Shetty", "Gowda", "Chopra", "Bose", "Mukherjee", "Thakur", "Yadav", "Jain", "Srivastava",
]


def make_student_name(index: int) -> str:
    last = LAST_NAMES[index % len(LAST_NAMES)]
    first = FIRST_NAMES[(index // len(LAST_NAMES)) % len(FIRST_NAMES)]
    return f"{first} {last}"


def make_enrollment(prefix: str, seq: int) -> str:
    return f"{prefix}2024{seq:03d}"


def generate_demo_student_records():
    records = []
    idx = 0
    for plan in CLASS_PLAN:
        for i in range(STUDENTS_PER_CLASS):
            seq = plan["start_num"] + i
            enrollment = make_enrollment(plan["prefix"], seq)
            records.append({
                "name": make_student_name(idx),
                "enrollment_number": enrollment,
                "password": DEMO_PASSWORD,
                "department_code": plan["dept_code"],
                "class_name": plan["class_name"],
                "email": f"{enrollment.lower()}@snapclass.edu",
            })
            idx += 1
    return records


def is_bulk_demo_generated() -> bool:
    meta = from_table("college_system_meta").select("value").eq("key", DEMO_META_KEY).maybe_single().execute()
    if meta.get("data") and meta["data"].get("value") == "true":
        return True

    markers = from_table("college_students").select("enrollment_number").in_(
        "enrollment_number", ["AIML2024150", "CYBER2024150"]
    ).execute()
    return len(markers.get("data") or []) >= 2


def mark_bulk_demo_generated():
    existing = from_table("college_system_meta").select("id").eq("key", DEMO_META_KEY).maybe_single().execute()
    if existing.get("data"):
        from_table("college_system_meta").update({"value": "true"}).eq("key", DEMO_META_KEY).execute()
    else:
        from_table("college_system_meta").insert([{"key": DEMO_META_KEY, "value": "true"}]).execute()


def bulk_insert_demo_students():
    if is_bulk_demo_generated():
        raise ValueError("Demo students already generated. Bulk generation can only run once.")

    depts_res = from_table("college_departments").select("id, code").execute()
    dept_map = {d["code"]: d["id"] for d in (depts_res.get("data") or [])}

    classes_res = from_table("college_classes").select("id, name").execute()
    class_map = {c["name"]: c["id"] for c in (classes_res.get("data") or [])}

    for plan in CLASS_PLAN:
        if plan["class_name"] not in class_map:
            raise ValueError(f"Class {plan['class_name']} not found. Run migration 003 first.")

    records = generate_demo_student_records()
    password_hash = hash_password(DEMO_PASSWORD)
    created = 0
    skipped = 0
    samples = []
    batch_size = 25

    for i in range(0, len(records), batch_size):
        chunk = records[i : i + batch_size]
        to_insert = []

        for r in chunk:
            ex = from_table("college_students").select("id").eq(
                "enrollment_number", r["enrollment_number"]
            ).maybe_single().execute()
            if ex.get("data"):
                skipped += 1
                continue
            to_insert.append({
                "enrollment_number": r["enrollment_number"],
                "password_hash": password_hash,
                "password_plain": r["password"],
                "name": r["name"],
                "email": r["email"],
                "department_id": dept_map[r["department_code"]],
                "class_id": class_map[r["class_name"]],
            })

        if not to_insert:
            continue

        ins = from_table("college_students").insert(to_insert).select(
            "id, enrollment_number, name, email"
        ).execute()
        if ins.get("error"):
            raise RuntimeError(ins["error"].get("message", "Bulk insert failed"))

        inserted = ins.get("data") or []
        fee_rows = [{
            "student_id": s["id"],
            "total_fee": 50000,
            "paid_amount": 0,
            "pending_amount": 50000,
            "status": "pending",
        } for s in inserted]
        from_table("college_fees").insert(fee_rows).execute()

        created += len(inserted)
        for s in inserted:
            if len(samples) >= 6:
                break
            rec = next(c for c in chunk if c["enrollment_number"] == s["enrollment_number"])
            samples.append({
                "name": s["name"],
                "enrollment_number": s["enrollment_number"],
                "password": DEMO_PASSWORD,
                "department": rec["department_code"],
                "class_name": rec["class_name"],
                "email": s["email"],
            })

    expected = TOTAL_DEMO_STUDENTS - skipped
    if created < expected:
        raise RuntimeError(f"Only {created} students created ({skipped} skipped). Expected {expected}.")

    mark_bulk_demo_generated()
    return {"created": created, "skipped": skipped, "total": TOTAL_DEMO_STUDENTS, "samples": samples}
