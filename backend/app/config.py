# config.py
import os
from pydantic import BaseSettings

class Settings(BaseSettings):
    DATABASE_URL: str = os.getenv("DATABASE_URL", "postgresql://user:pass@localhost:5432/bridge_db")
    MONGODB_URL: str = os.getenv("MONGODB_URL", "mongodb://localhost:27017")
    SECRET_KEY: str = os.getenv("SECRET_KEY", "supersecret")
    ALGORITHM: str = "HS256"
    ACCESS_TOKEN_EXPIRE_MINUTES: int = 30

settings = Settings()
