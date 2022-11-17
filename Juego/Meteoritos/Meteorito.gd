class_name Meteorito
extends RigidBody2D

## Export Attributes
export var vel_lineal_base:Vector2 = Vector2(300.0, 300.0)
export var vel_ang_base:float = 3.0

## Methods
func _ready() -> void:
	angular_velocity = vel_ang_base

## Contructor
func crear(pos: Vector2, dir: Vector2) -> void:
	position = pos
	linear_velocity = vel_lineal_base * dir
