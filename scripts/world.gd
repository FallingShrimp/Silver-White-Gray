extends Node2D

@onready var eventloop: ShrimpEventLoop = $%eventloop
@onready var canvas: CustomCanvas = $%canvas

func _ready() -> void:
	eventloop.add_resource("canvas", eventloop)
