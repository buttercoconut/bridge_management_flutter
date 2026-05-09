# app/services/bridge_service.py
from sqlalchemy.orm import Session
from app.api.models import Bridge
from app.api.schemas import BridgeCreate

class BridgeService:
    def __init__(self, db: Session):
        self.db = db

    async def create_bridge(self, bridge_in: BridgeCreate) -> Bridge:
        bridge = Bridge(**bridge_in.dict())
        self.db.add(bridge)
        self.db.commit()
        self.db.refresh(bridge)
        return bridge

    async def list_bridges(self) -> list[Bridge]:
        return self.db.query(Bridge).all()

    async def get_bridge(self, bridge_id: int) -> Bridge:
        bridge = self.db.query(Bridge).filter(Bridge.id == bridge_id).first()
        if not bridge:
            raise Exception("Bridge not found")
        return bridge
