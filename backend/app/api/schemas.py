# app/api/schemas.py
from pydantic import BaseModel, Field
from datetime import datetime
from typing import List, Optional

class BridgeBase(BaseModel):
    name: str = Field(..., example="Seoul Bridge")
    location: str = Field(..., example="Seoul, Korea")

class BridgeCreate(BridgeBase):
    pass

class Bridge(BridgeBase):
    id: int
    created_at: datetime

    class Config:
        orm_mode = True

class SensorBase(BaseModel):
    type: str
    location: Optional[str]

class SensorCreate(SensorBase):
    bridge_id: int

class Sensor(SensorBase):
    id: int
    bridge_id: int

    class Config:
        orm_mode = True

class MaintenanceTaskBase(BaseModel):
    description: str
    scheduled_date: datetime
    status: Optional[str] = "scheduled"

class MaintenanceTaskCreate(MaintenanceTaskBase):
    bridge_id: int

class MaintenanceTask(MaintenanceTaskBase):
    id: int
    bridge_id: int

    class Config:
        orm_mode = True
