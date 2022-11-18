class_name Meteorito
extends RigidBody2D

## Export Attributes
export var vel_lineal_base:Vector2 = Vector2(300.0, 300.0)
export var vel_ang_base:float = 3.0
export var hitpoints_base:float = 10.0

onready var impacto_sfx:AudioStreamPlayer2D = $ImpactoSFX

## Attributes
var hitpoints:float

## Custom Methods
func recibir_danio(danio: float) -> void:
	hitpoints -= danio
	if hitpoints <= 0:
		destruir()
	impacto_sfx.play()
	$AnimationPlayer.play("impacto")
	
func destruir() -> void:
	$CollisionShape2D.set_deferred("disabled", true)
	Eventos.emit_signal("meteorito_destruido", global_position)
	queue_free()

## Methods
func _ready() -> void:
	angular_velocity = vel_ang_base

## Contructor
func crear(pos: Vector2, dir: Vector2, tamanio: float) -> void:
	position = pos
	mass *= tamanio
	$Sprite.scale = Vector2.ONE * tamanio
	var radio:int = int($Sprite.texture.get_size().x / 2.3 * tamanio)
	var forma_colision:CircleShape2D = CircleShape2D.new()
	forma_colision.radius = radio
	$CollisionShape2D.shape = forma_colision
	linear_velocity = vel_lineal_base * dir / tamanio
	angular_velocity = vel_ang_base / tamanio
	hitpoints = hitpoints_base * tamanio
	print("hitpoints", hitpoints)

