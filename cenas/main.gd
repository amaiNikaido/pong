extends Node2D

var score := [0, 0]


# Called when the node enters tdhe scene tree for the first time.
func _ready() -> void:
	start_game()

func start_game() -> void:
	$Raquete.position.x = 16
	$Inimigo.position.x = 240
	$Raquete.position.y = 72
	$Inimigo.position.y = 72
	
	
	
func _process(delta: float) -> void:
	pass


func _on_timer_da_bola_timeout() -> void:
	$Bola.nova_bola()
