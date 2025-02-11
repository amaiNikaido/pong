extends Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_wait_time(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	set_wait_time(tempo_spawn)


func _on_p_timer_timeout() -> void:
	tempo_spawn = randi_range(1,20)
	
