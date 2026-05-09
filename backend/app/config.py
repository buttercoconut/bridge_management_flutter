# config.py
from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    # Database
    POSTGRES_DB: str = "bridge_db"
    POSTGRES_USER: str = "postgres"
    POSTGRES_PASSWORD: str = "postgres"
    POSTGRES_HOST: str = "localhost"
    POSTGRES_PORT: int = 5432

    # MongoDB
    MONGO_URI: str = "mongodb://localhost:27017"
    MONGO_DB: str = "bridge_sensor"

    # FastAPI
    APP_NAME: str = "Bridge Management API"
    DEBUG: bool = True

    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"

settings = Settings()
