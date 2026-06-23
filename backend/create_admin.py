#!/usr/bin/env python3
"""
Create admin user in production database.
Run this after setting up the DATABASE_URL environment variable.
"""
import sys
from pathlib import Path

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent))

from sqlalchemy.orm import Session
from app.database.connection import engine, get_db
from app.models.user import User
from app.services.auth_service import get_password_hash
from datetime import datetime

def create_admin_user():
    """Create admin user if it doesn't exist."""
    db = Session(engine)

    try:
        # Check if admin user already exists
        existing_admin = db.query(User).filter(User.email == "admin@ocrbank.local").first()
        if existing_admin:
            print("✅ Admin user already exists")
            print(f"   Email: admin@ocrbank.local")
            return

        # Create admin user with shorter password for bcrypt compatibility
        admin_user = User(
            email="admin@ocrbank.local",
            name="Admin",
            password_hash=get_password_hash("Admin@2026"),
            is_active=True,
            is_admin=True
        )

        db.add(admin_user)
        db.commit()
        db.refresh(admin_user)

        print("✅ Admin user created successfully")
        print(f"   ID: {admin_user.id}")
        print(f"   Email: {admin_user.email}")
        print(f"   Name: {admin_user.name}")
        print(f"   Password: Admin@2026")
        print(f"   Admin: {admin_user.is_admin}")

    except Exception as e:
        print(f"❌ Error creating admin user: {e}")
        db.rollback()
        raise
    finally:
        db.close()

def create_test_user():
    """Create test user if it doesn't exist."""
    db = Session(engine)

    try:
        # Check if test user already exists
        existing_test = db.query(User).filter(User.email == "test@ocrbank.local").first()
        if existing_test:
            print("✅ Test user already exists")
            return

        # Create test user
        test_user = User(
            email="test@ocrbank.local",
            name="Test User",
            password_hash=get_password_hash("test123"),
            is_active=True,
            is_admin=False
        )

        db.add(test_user)
        db.commit()
        db.refresh(test_user)

        print("✅ Test user created successfully")
        print(f"   Email: {test_user.email}")
        print(f"   Username: {test_user.username}")
        print(f"   Password: test123")

    except Exception as e:
        print(f"❌ Error creating test user: {e}")
        db.rollback()
        raise
    finally:
        db.close()

if __name__ == "__main__":
    print("🚀 Creating users in Supabase database...")
    create_admin_user()
    create_test_user()
    print("✅ User setup complete!")