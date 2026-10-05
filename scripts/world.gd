extends Node2D

func _ready() -> void:
	for i in ShrimpArrayUtil.ArrayZip.new([[1, 2, 3], ["a", "b", "c"]]):
		print(i)
