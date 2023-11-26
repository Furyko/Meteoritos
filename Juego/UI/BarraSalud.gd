class_name BarraSalud
extends ProgressBar

## Onready Attributes
onready var tween_visibilidad:Tween = $TweenVisibilidad

## Methods
func _ready() -> void:
	modulate = Color(1, 1, 1, 0)

## Custom Methods
func controlar_barra(hitpoints_nave: float, mostrar:bool) -> void:
	value = hitpoints_nave
	
	if not tween_visibilidad.is_active() and modulate.a != int(mostrar):
		tween_visibilidad.interpolate_property(
			self,
			"modulate",
			Color(1,1,1,not mostrar),
			Color(1,1,1, mostrar),
			1.0,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN_OUT
		)
		tween_visibilidad.start()
		
## Internal Signals
func _on_TweenVisibilidad_tween_all_completed() -> void:
	if modulate.a == 1.0:
		controlar_barra(value, false)
