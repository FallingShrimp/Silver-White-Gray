extends ShrimpBaseSystem
class_name RenderingSystem

func execute(eventloop: ShrimpEventLoop) -> void:
	for record in eventloop.query_entity(["renderable"]):
		match record:
			[ var _id, var components]:
				var transform: Transformable = null
				for component in components:
					if component is Renderable:
						var canvas = eventloop.get_resource("canvas")
						if canvas is CustomCanvas:
							canvas.callback = func(_c):
								print("tr", transform)
								# canvas.draw_circle()
							canvas.queue_redraw()
					elif component is Transformable:
						transform = component
