extends ShrimpBaseSystem
class_name RenderingSystem

func execute(eventloop: ShrimpEventLoop) -> void:
	for record in eventloop.query_entity(["renderable", "transformable"]):
		match record:
			[ var _id, var components]:
				var transform: Transformable = null
				var drawn = false
				while !drawn:
					for component in components:
						if component is Renderable:
							if !transform: continue
							var canvas = eventloop.get_resource("canvas")
							if canvas is CustomCanvas:
								canvas.callback = func(_c):
									canvas.draw_circle(transform.position, 20, Color.from_hsv(randf(), 1, 1), true)
								canvas.queue_redraw()
								drawn = true
						elif component is Transformable:
							transform = component
