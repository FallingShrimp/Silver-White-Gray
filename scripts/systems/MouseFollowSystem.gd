extends ShrimpBaseSystem
class_name MouseFollowSystem

func execute(eventloop: ShrimpEventLoop) -> void:
	for record in eventloop.query_entity(["transformable"]):
		match record:
			[ var _id, var components]:
				for component in components:
					if component is Transformable:
						var canvas = eventloop.get_resource("canvas")
						if canvas is Node2D:
							component.position += Vector2.from_angle(component.position.angle_to_point(canvas.get_global_mouse_position())) * component.speed * eventloop.get_resource("delta")
