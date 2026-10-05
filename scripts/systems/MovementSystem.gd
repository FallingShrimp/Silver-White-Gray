extends ShrimpBaseSystem

func execute(eventloop: ShrimpEventLoop) -> void:
	eventloop.query(["transformable"])
