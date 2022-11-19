class_name SectrMeteoritos
extends Node2D


## Intern Signals
func _on_SpawnTimer_timeout():
	for spawner in $Spawners.get_children():
		spawner.spawnear_meteorito()
