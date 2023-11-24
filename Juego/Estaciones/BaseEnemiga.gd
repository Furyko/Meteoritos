class_name BaseEnemiga
extends Node2D

## Attributes Export
export var hitpoints:float = 30.0

## Attributes Onready
onready var impacto_sfx:AudioStreamPlayer2D = $ImpactoSFX

## Attributes
var esta_destruida:bool = false

## Methods
func _ready() -> void:
	$AnimationPlayer.play(elegir_animacion_aleatoria())

## Custom Methods
func recibir_danio(danio:float) -> void:
	hitpoints -= danio
	
	if hitpoints <= 0 and not esta_destruida:
		esta_destruida = true
		destruir()
	
	impacto_sfx.play()

func destruir() -> void:
	var posicion_partes = [
		$Sprites/Sprite2.global_position,
		$Sprites/Sprite3.global_position,
		$Sprites/Sprite4.global_position,
		$Sprites/Sprite.global_position
	]
	
	Eventos.emit_signal("base_destruida", posicion_partes)
	queue_free()

func elegir_animacion_aleatoria() -> String:
	randomize()
	var num_anim:int = $AnimationPlayer.get_animation_list().size() - 1
	var indice_anim_aleatoria:int = randi() % num_anim + 1
	var lista_animacion:Array = $AnimationPlayer.get_animation_list()
	
	return lista_animacion[indice_anim_aleatoria]

## Internal Signals
func _on_AreaColision_body_entered(body):
	if body.has_method("destruir"):
		body.destruir()
