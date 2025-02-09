extends StaticBody2D

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
