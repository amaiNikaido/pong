extends PopupPanel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("G") and visible:
		hide()
		g_power_up()
		if chance_reaparecer():
			$RandomPopUp4.start()
		
		
func g_power_up() -> void:
	##powerup
	pass
	

func _on_random_pop_up_4_timeout() -> void:
	$TimerSegundo4.start()
	popup()


func _on_timer_segundo_4_timeout() -> void:
	hide()
	$RandomPopUp4.start()
	
func chance_reaparecer() -> bool:
	## Checa qual a chance de o power up reaparecer apos ser utilizado com sucesso
	var chance = randi_range(0,26)
	if chance >= 15:
		return true
	else: 
		return false
