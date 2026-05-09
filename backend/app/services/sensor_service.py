# app/services/sensor_service.py
from sqlalchemy.orm import Session
from app.api.models import Sensor
from app.api.schemas import SensorCreate

class SensorService:
    def __init__(self, db: Session):
        self.db = db

    async def create_sensor(self, sensor_in: SensorCreate) -> Sensor:
        sensor = Sensor(**sensor_in.dict())
        self.db.add(sensor)
        self.db.commit()
        self.db.refresh(sensor)
        return sensor

    async def list_sensors(self) -> list[Sensor]:
        return self.db.query(Sensor).all()
