# app/api/routes.py
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from datetime import datetime

from app.api.models import Bridge, Sensor, MaintenanceTask
from app.api.schemas import BridgeCreate, Bridge as BridgeSchema, SensorCreate, MaintenanceTaskCreate
from app.api.dependencies import get_db
from app.services.bridge_service import BridgeService
from app.services.sensor_service import SensorService
from app.services.maintenance_service import MaintenanceService

router = APIRouter()

# Bridge endpoints
@router.post("/bridges", response_model=BridgeSchema)
async def create_bridge(bridge: BridgeCreate, db: Session = Depends(get_db)):
    service = BridgeService(db)
    return await service.create_bridge(bridge)

@router.get("/bridges", response_model=list[BridgeSchema])
async def list_bridges(db: Session = Depends(get_db)):
    service = BridgeService(db)
    return await service.list_bridges()

@router.get("/bridges/{bridge_id}", response_model=BridgeSchema)
async def get_bridge(bridge_id: int, db: Session = Depends(get_db)):
    service = BridgeService(db)
    return await service.get_bridge(bridge_id)

# Sensor endpoints
@router.post("/sensors", response_model=Sensor)
async def create_sensor(sensor: SensorCreate, db: Session = Depends(get_db)):
    service = SensorService(db)
    return await service.create_sensor(sensor)

@router.get("/sensors", response_model=list[Sensor])
async def list_sensors(db: Session = Depends(get_db)):
    service = SensorService(db)
    return await service.list_sensors()

# Maintenance endpoints
@router.post("/maintenance", response_model=MaintenanceTask)
async def create_task(task: MaintenanceTaskCreate, db: Session = Depends(get_db)):
    service = MaintenanceService(db)
    return await service.create_task(task)

@router.get("/maintenance", response_model=list[MaintenanceTask])
async def list_tasks(db: Session = Depends(get_db)):
    service = MaintenanceService(db)
    return await service.list_tasks()

@router.put("/maintenance/{task_id}", response_model=MaintenanceTask)
async def update_task(task_id: int, status: str, db: Session = Depends(get_db)):
    service = MaintenanceService(db)
    return await service.update_task(task_id, status)
