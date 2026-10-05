extends CanvasItem
class_name CustomCanvas

var callback: Callable

func _draw() -> void:
	callback.call(self)
