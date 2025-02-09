extends Node2D

var score := [0, 0]


# Called when the node enters tdhe scene tree for the first time.
func _ready() -> void:
	start_game()

func start_game() -> void:
	$Fim.hide()
	$Jogador.position.x = 16
	$Inimigo.position.x = 240
	$Jogador.position.y = 72
	$Inimigo.position.y = 72
	$Hud/PontosJogador.text = '0'
	$Hud/PontosInimigo.text = '0'
	
	
	
func _process(delta: float) -> void:
	if score[0] == 3 or score[1] == 3:
		$Fim.show()
		#Reinicia o jogo
		if Input.is_action_just_pressed("enter"):
			get_tree().reload_current_scene()


func _on_timer_da_bola_timeout() -> void:
	$Bola.nova_bola()


func _on_gol_direito_body_entered(body):
	score[1] += 1
	$Hud/PontosInimigo.text = str(score[1])
	if score[1] < 3:
		$TimerDaBola.start()

func _on_gol_esquerdo_body_entered(body):
	score[0] += 1
	$Hud/PontosJogador.text = str(score[0])
	if score[0] < 3:
		$TimerDaBola.start()

func P_PowerUp() -> void:
	if score[0] == 1 or score[1] == 1:
		$PowerUpP.show()
