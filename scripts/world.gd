extends Node2D

@onready var eventloop: ShrimpEventLoop = $%eventloop
@onready var canvas: CustomCanvas = $%canvas

func _ready() -> void:
	eventloop.add_resource("canvas", canvas)
	for i in 10:
		eventloop.spawn([Renderable.new(), Transformable.new(randf_range(20, 400))])
