extends ShrimpBaseSystem
class_name RenderingSystem

func execute(eventloop: ShrimpEventLoop) -> void:
	for record in eventloop.query_entity(["renderable"]):
		match record:
			[ var _id, var components]:
				for component in components:
					if component is Renderable:
						var canvas = eventloop.get_resource("canvas")
						if canvas is CustomCanvas:
							canvas.callback = func(_c):
								canvas.draw_circle()
