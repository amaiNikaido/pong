extends Node2D
signal ponto



# Called when the node enters tdhe scene tree for the first time.
func _ready() -> void:
	start_game()

func start_game() -> void:
	$Fim.visible = false
	$Jogador.position.x = 6
	$Jogador2.position.x = 506
	$Jogador.position.y = 136
	$Jogador2.position.y = 136
	Global.score[1] = 0
	Global.score[0] = 0
	$Hud/PontosJogador.text = str(Global.score[0])
	$Hud/PontosInimigo.text = str(Global.score[1])
	
	
	
func _process(delta: float) -> void:
	if Global.score[0] == 6 or Global.score[1] == 6:
		$Fim.show()
		if Input.is_action_just_pressed("y"):
			start_game()
			$Bola.nova_bola()
		elif  Input.is_action_just_pressed("n"):
			get_tree().quit()


func _on_timer_da_bola_timeout() -> void:
	$Bola.nova_bola()


# Estava invertido, mudei.
func _on_gol_direito_body_entered(body):
	Global.score[0] += 1
	$Hud/PontosJogador.text = str(Global.score[0])
	#ponto.emit()
	if Global.score[0] < 6:
		$TimerDaBola.start()

func _on_gol_esquerdo_body_entered(body):
	Global.score[1] += 1
	$Hud/PontosInimigo.text = str(Global.score[1])
	#ponto.emit()
	if Global.score[1] < 6:
		$TimerDaBola.start()
