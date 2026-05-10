# services/bridge_service.py
from sqlalchemy.orm import Session
from app.api.models import BridgeCreate, Bridge
from app.api.models import Bridge as BridgeModel

class BridgeService:
    def __init__(self, db: Session):
        self.db = db

    def create_bridge(self, bridge_in: BridgeCreate) -> Bridge:
        bridge = BridgeModel(**bridge_in.dict())
        self.db.add(bridge)
        self.db.commit()
        self.db.refresh(bridge)
        return bridge

    def list_bridges(self) -> list[Bridge]:
        return self.db.query(BridgeModel).all()
