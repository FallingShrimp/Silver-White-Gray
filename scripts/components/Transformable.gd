extends ShrimpBaseComponent
class_name Transformable

var speed: float
var position: Vector2
var scale: Vector2
var rotation: float

func _init(xspeed: float = 200, xposition: Vector2 = Vector2.ZERO, xscale: Vector2 = Vector2.ONE, xrotation: float = 0) -> void:
	speed = xspeed
	position = xposition
	scale = xscale
	rotation = xrotation

func get_component_id() -> StringName:
	return "transformable"
