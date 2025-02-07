extends Node2D

var score := [0, 0]


# Called when the node enters tdhe scene tree for the first time.
func _ready() -> void:
	start_game()

func start_game() -> void:
	$Raquete.position.x = 16
#	$Raquete2.position.x = 240
	$Raquete.position.y = 72
#	$Raquete2.position.y = 72
	
	
	
func _process(delta: float) -> void:
	pass
