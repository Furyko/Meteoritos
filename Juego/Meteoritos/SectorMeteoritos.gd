class_name SectorMeteoritos
extends Node2D

## Export Attributes
export var cantidad_meteoritos:int = 10

## Attributes
var spawners:Array

## Methods
func _ready() -> void:
	almacenar_spawners()

## Custom Methods
func almacenar_spawners() -> void:
	for spawner in $Spawners.get_children():
		spawners.append(spawner)
		
func spawner_aleatorio() -> int:
	randomize()
	return randi() % spawners.size()

## Intern Signals
func _on_SpawnTimer_timeout():
	if cantidad_meteoritos == 0:
		$SpawnTimer.stop()
		return
	spawners[spawner_aleatorio()].spawnear_meteorito()
	cantidad_meteoritos -= 1
	
