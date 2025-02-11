extends PopupPanel
signal power_up
var animacao : int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("N") and visible:
		hide()
		power_up.emit()
		if chance_reaparecer():
			$RandomPopUp3.start()
	
func n_power_up() -> void:
	##powerup
	pass
	

func _on_random_pop_up_3_timeout() -> void:
	$TimerSegundo3.start()
	popup()


func _on_timer_segundo_3_timeout() -> void:
	hide()
	$RandomPopUp3.start()
	
func chance_reaparecer() -> bool:
	## Checa qual a chance de o power up reaparecer apos ser utilizado com sucesso
	var chance = randi_range(1,20)
	if chance >= 12:
		return true
	else: 
		return false
