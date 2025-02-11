extends Timer
var tempo_spawn : int 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tempo_spawn = randi_range(34,42)
	set_wait_time(tempo_spawn)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_segundo_3_timeout() -> void:
	tempo_spawn = randi_range(34,42)
	set_wait_time(tempo_spawn)
