extends CharacterBody2D

const VELOCIDADE_INICIAL : int = 128
const ACELERACAO : int = 16
var velocidade : int
var direcao : Vector2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision = move_and_collide(direcao * velocidade * delta)
	if collision:
		direcao = direcao.bounce(collision.get_normal())
		velocidade += ACELERACAO
		
		Global.cor_bola += 1
		if Global.cor_bola > 3:
			Global.cor_bola = 0
	
	$Label.text = str(Global.cor_bola)
	
	if Global.cor_raquete == Global.cor_bola:
		set_collision_mask_value(2, true)
	elif Global.cor_raquete != Global.cor_bola:
		set_collision_mask_value(2, false)
		
	if Global.cor_bola == 0:
		$Sprite2D.texture = load("res://sprites/bolas/Bola1.png")
	elif  Global.cor_bola == 1:
		$Sprite2D.texture = load("res://sprites/bolas/Bola2.png")
	elif  Global.cor_bola == 2:
		$Sprite2D.texture = load("res://sprites/bolas/Bola3.png")
	elif  Global.cor_bola == 3:
		$Sprite2D.texture = load("res://sprites/bolas/Bola4.png")


func nova_bola():
	position.x = 256
	position.y = 144
	velocidade = VELOCIDADE_INICIAL
	direcao = direcao_aleatoria()
	

func direcao_aleatoria():
	var nova_direcao := Vector2()
	nova_direcao.x = [1, -1].pick_random()
	nova_direcao.y = randf_range(-1, 1)
	return nova_direcao.normalized()
