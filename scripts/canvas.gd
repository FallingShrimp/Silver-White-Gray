extends CanvasItem
class_name CustomCanvas

var callback: Callable

func _draw() -> void:
	if callback:
		callback.call(self)
