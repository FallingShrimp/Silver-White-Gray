extends ShrimpBaseComponent
class_name Transformable

var speed: float
var position: Vector2
var scale: Vector2
var rotation: float

func _init(xspeed: float, xposition: Vector2, xscale: Vector2, xrotation: float) -> void:
	speed = xspeed
	position = xposition
	scale = xscale
	rotation = xrotation

func get_component_id() -> StringName:
	return "transformable"
