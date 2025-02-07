extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_game()

func start_game() -> void:
	$Raquete.position.x = 100
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
