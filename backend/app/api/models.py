# app/api/models.py
from sqlalchemy import Column, Integer, String, DateTime, Float, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Bridge(Base):
    __tablename__ = "bridges"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, unique=True, index=True, nullable=False)
    location = Column(String, nullable=False)
    created_at = Column(DateTime, server_default="now()")
    sensors = relationship("Sensor", back_populates="bridge")
    maintenance_tasks = relationship("MaintenanceTask", back_populates="bridge")

class Sensor(Base):
    __tablename__ = "sensors"
    id = Column(Integer, primary_key=True, index=True)
    bridge_id = Column(Integer, ForeignKey("bridges.id"))
    type = Column(String, nullable=False)
    location = Column(String)
    bridge = relationship("Bridge", back_populates="sensors")

class MaintenanceTask(Base):
    __tablename__ = "maintenance_tasks"
    id = Column(Integer, primary_key=True, index=True)
    bridge_id = Column(Integer, ForeignKey("bridges.id"))
    description = Column(String)
    scheduled_date = Column(DateTime)
    status = Column(String, default="scheduled")
    bridge = relationship("Bridge", back_populates="maintenance_tasks")
