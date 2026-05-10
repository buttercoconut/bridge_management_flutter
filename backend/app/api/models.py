# api/models.py
from pydantic import BaseModel, Field
from datetime import datetime

class BridgeBase(BaseModel):
    name: str
    location: str
    length_m: float
    width_m: float
    year_built: int

class BridgeCreate(BridgeBase):
    pass

class Bridge(BridgeBase):
    id: int
    created_at: datetime
    updated_at: datetime

    class Config:
        orm_mode = True
