extends PopupPanel
signal power_up
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("P") and visible:
		print("p")
		$"../../Jogador".aumento()
		hide()
		power_up.emit()
		if chance_reaparecer():
			$RandomPopUp1.start()


func _on_random_pop_up_1_timeout() -> void:
	$TimerSegundo1.start()
	popup()


func _on_timer_segundo_1_timeout() -> void:
	hide()
	$RandomPopUp1.start()
	
func chance_reaparecer() -> bool:
	## Checa qual a chance de o power up reaparecer apos ser utilizado com sucesso
	var chance = randi_range(1,10)
	if chance >= 5:
		return true
	else: 
		return false
