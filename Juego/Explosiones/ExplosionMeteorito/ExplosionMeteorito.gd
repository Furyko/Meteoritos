class_name ExplosionMeteorito
extends Node2D

onready var destroy_sfx:AudioStreamPlayer2D = $DestroySFX

func _ready():
	destroy_sfx.play()
	$AnimationPlayer.play("explosion")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	queue_free()
