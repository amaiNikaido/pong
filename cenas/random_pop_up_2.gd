extends Timer
var tempo_spawn : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tempo_spawn = randi_range(25,28)
	set_wait_time(tempo_spawn)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_segundo_2_timeout() -> void:
	tempo_spawn = randi_range(25,28)
	set_wait_time(tempo_spawn)
