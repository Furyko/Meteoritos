class_name EnemigoInterceptor
extends EnemigoBase

## Enums
enum ESTADO_IA {IDLE, ATACANDOQ, ATACANDOP, PERSECUCION}

## Attributes
var estado_ia_actual:int = ESTADO_IA.IDLE

## Custom Methods
func controlador_estados_ia(nuevo_estado: int) -> void:
	match nuevo_estado:
		ESTADO_IA.IDLE:
			canion.set_esta_disparando(false)
		ESTADO_IA.ATACANDOQ:
			canion.set_esta_disparando(true)
		ESTADO_IA.ATACANDOP:
			canion.set_esta_disparando(true)
		ESTADO_IA.PERSECUCION:
			canion.set_esta_disparando(false)
		_:
			printerr("Error de estado")
	estado_ia_actual = nuevo_estado

## Internal Signals
func _on_AreaDisparo_body_entered(body: Node) -> void:
	controlador_estados_ia(ESTADO_IA.ATACANDOP)

func _on_AreaDisparo_body_exited(body: Node) -> void:
	controlador_estados_ia(ESTADO_IA.PERSECUCION)

func _on_AreaDeteccion_body_entered(body: Node) -> void:
	controlador_estados_ia(ESTADO_IA.ATACANDOQ)

func _on_AreaDeteccion_body_exited(body: Node) -> void:
	controlador_estados_ia(ESTADO_IA.ATACANDOP)
