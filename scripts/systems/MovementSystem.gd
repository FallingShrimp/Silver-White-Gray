extends ShrimpBaseSystem
class_name MovementSystem

func execute(eventloop: ShrimpEventLoop, delta: float) -> void:
	for record in eventloop.query(["transformable"]):
		match record:
			[ var _id, var components]:
				var direction = Input.get_vector("l", "r", "u", "d")
				for component in components:
					if component is Transformable:
						component.position += direction * component.speed * delta
						print(component)
