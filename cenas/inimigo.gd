extends StaticBody2D

var velocidade = 64
var posicao_bola : Vector2
var direcao : int
var velocity = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	posicao_bola = $"../Bola".position
	direcao = posicao_bola.y - position.y
	
	if direcao > 0:
		position.y += velocidade * delta
	elif direcao < 0:
		position.y -= velocidade * delta

func _physics_process(delta: float) -> void:
	velocity = velocity.normalized() * velocidade
	move_and_collide(velocity * delta)
