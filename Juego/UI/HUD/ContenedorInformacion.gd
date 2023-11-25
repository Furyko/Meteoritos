class_name ContenedorInformacion
extends NinePatchRect

## Onready Attributes
onready var texto_contenedor:Label = $Label
onready var auto_ocultar_timer = $AutoOcultarTimer
onready var animaciones:AnimationPlayer = $AnimationPlayer

## Export Attributes
export var auto_ocultar:bool = false setget set_auto_ocultar

## Methods
func mostrar() -> void:
	animaciones.play("mostrar")
	
func ocultar() -> void:
	animaciones.play("ocultar")
	
func set_auto_ocultar(ocultar: bool) -> void:
	auto_ocultar = ocultar
	
func mostrar_suavizado() -> void:
	animaciones.play("mostrar_suavizado")
	if auto_ocultar:
		auto_ocultar_timer.start()
	
func ocultar_suavizado() -> void:
	animaciones.play("ocultar_suavizado")

func modificar_texto(text: String) -> void:
	texto_contenedor.text = text

func _on_AutoOcultarTimer_timeout() -> void:
	ocultar_suavizado()
