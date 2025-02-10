extends PopupPanel
var screentime = 1



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("P") and visible:
		hide()
		p_power_up()
		
func p_power_up() -> void:
	##Aumenta o tamanho da Raquete
	pass

func _on_main_ponto() -> void:
	$PTimer.start()
	popup()

func _on_p_timer_timeout() -> void:
	##Esconde o PUp em 1 segundo
	hide()
