extends CharacterBody2D

var lado_vencedor : Vector2
const VELOCIDADE_INICIAL : int = 60
const ACELERACAO : int = 10
var velocidade : int
var direcao : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lado_vencedor = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision = move_and_collide(direcao * velocidade * delta)
	if collision:
		direcao = direcao.bounce(collision.get_normal())
		velocidade += ACELERACAO

func _physics_process(delta: float) -> void:
	#var colisao = move_and_collide(direcao * velocidade * delta)
	#if colisao:
		#colisao = colisao.get_collider()
		#if colisao == $"../Parede esquerda":
			#self
	pass

func nova_bola():
	position.x = lado_vencedor.x / 2
	position.y = randi_range(100, lado_vencedor.y - 100)
	velocidade = VELOCIDADE_INICIAL
	direcao = direcao_aleatoria()
	

func direcao_aleatoria():
	var nova_direcao := Vector2()
	nova_direcao.x = [1, -1].pick_random()
	nova_direcao.y = randf_range(-1, 1)
	return nova_direcao.normalized()
