extends CharacterBody2D

var velocidade = 64
var posicao_bola : Vector2
var direcao : int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	posicao_bola = $"../Bola".position
	direcao = posicao_bola.y - position.y
	
	if direcao > 0:
		position.y += velocidade * delta
	elif direcao < 0:
		position.y -= velocidade * delta

	if Global.cor_bola == 0:
		$Sprite2D.texture = load("res://sprites/raquetes/raquete1.png")
	elif  Global.cor_bola == 1:
		$Sprite2D.texture = load("res://sprites/raquetes/raquete2.png")
	elif  Global.cor_bola == 2:
		$Sprite2D.texture = load("res://sprites/raquetes/raquete3.png")
	elif  Global.cor_bola == 3:
		$Sprite2D.texture = load("res://sprites/raquetes/raquete4.png")
