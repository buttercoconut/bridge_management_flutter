# app/services/maintenance_service.py
from sqlalchemy.orm import Session
from app.api.models import MaintenanceTask
from app.api.schemas import MaintenanceTaskCreate

class MaintenanceService:
    def __init__(self, db: Session):
        self.db = db

    async def create_task(self, task_in: MaintenanceTaskCreate) -> MaintenanceTask:
        task = MaintenanceTask(**task_in.dict())
        self.db.add(task)
        self.db.commit()
        self.db.refresh(task)
        return task

    async def list_tasks(self) -> list[MaintenanceTask]:
        return self.db.query(MaintenanceTask).all()

    async def update_task(self, task_id: int, status: str) -> MaintenanceTask:
        task = self.db.query(MaintenanceTask).filter(MaintenanceTask.id == task_id).first()
        if not task:
            raise Exception("Task not found")
        task.status = status
        self.db.commit()
        self.db.refresh(task)
        return task
