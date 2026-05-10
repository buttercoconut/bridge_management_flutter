# api/routes.py
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from typing import List

from app.api.models import Bridge, BridgeCreate
from app.services.bridge_service import BridgeService
from app.api.dependencies import get_current_user

router = APIRouter()

# Dependency for DB session placeholder
async def get_db():
    # In real implementation, yield a SQLAlchemy session
    pass

@router.post("/bridges", response_model=Bridge)
async def create_bridge(bridge: BridgeCreate, db: Session = Depends(get_db), user: str = Depends(get_current_user)):
    service = BridgeService(db)
    return service.create_bridge(bridge)

@router.get("/bridges", response_model=List[Bridge])
async def list_bridges(db: Session = Depends(get_db), user: str = Depends(get_current_user)):
    service = BridgeService(db)
    return service.list_bridges()
