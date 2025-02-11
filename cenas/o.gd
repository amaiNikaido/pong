extends PopupPanel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("O") and visible:
		print("o")
		$"../../Jogador2".trava()
		hide()
		if chance_reaparecer():
			$RandomPopUp2.start()
		
func o_power_up() -> void:
	##powerup
	pass
	

func _on_random_pop_up_2_timeout() -> void:
	$TimerSegundo2.start()
	popup()


func _on_timer_segundo_2_timeout() -> void:
	hide()
	$RandomPopUp2.start()
	
func chance_reaparecer() -> bool:
	## Checa qual a chance de o power up reaparecer apos ser utilizado com sucesso
	var chance = randi_range(1,20)
	if chance <= 5:
		return true
	else: 
		return false
