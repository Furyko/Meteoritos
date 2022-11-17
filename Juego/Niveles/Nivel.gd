class_name Nivel
extends Node2D

## Export Attributes
export var explosion:PackedScene = null
export var meteorito:PackedScene = null

## Onready Attributes
onready var contenedor_proyectiles:Node
onready var contenedor_meteoritos:Node

## Metodos
func _ready() -> void:
	conectar_seniales()
	crear_contenedores()

## Metodos Custom
func conectar_seniales() -> void:
	Eventos.connect("disparo", self, "_on_disparo")
	Eventos.connect("nave_destruida", self, "_on_nave_destruida")
	Eventos.connect("spawn_meteorito", self, "_on_spawn_meteoritos")
	
func crear_contenedores() -> void:
	contenedor_proyectiles = Node.new()
	contenedor_proyectiles.name = "ContenedorProyectiles"
	add_child(contenedor_proyectiles)
	contenedor_meteoritos = Node.new()
	contenedor_meteoritos.name = "ContenedorMeteoritos"
	add_child(contenedor_meteoritos)

func _on_disparo(proyectil:Proyectil) -> void:
	contenedor_proyectiles.add_child(proyectil)
	
## External signals conection
	
func _on_nave_destruida(posicion: Vector2, num_explosiones: int) -> void:
	for i in range(num_explosiones):
		var new_explosion:Node2D = explosion.instance()
		new_explosion.global_position = posicion
		add_child(new_explosion)
		yield(get_tree().create_timer(0.6),"timeout")
	
func _on_spawn_meteoritos(pos_spawn: Vector2, dir_meteorito: Vector2) -> void:
	print(pos_spawn)
	var new_meteorito:Meteorito = meteorito.instance()
	new_meteorito.crear(
		pos_spawn,
		dir_meteorito
	)
	contenedor_meteoritos.add_child(new_meteorito)
