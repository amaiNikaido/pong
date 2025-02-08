extends StaticBody2D

var lado_vencedor : Vector2
const VELOCIDADE_INICIAL : int = 128
const ACELERACAO : int = 16
var velocidade : int
var direcao : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lado_vencedor = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:


func nova_bola():
	position.x = lado_vencedor.x / 2
	position.y = randi_range(200, lado_vencedor.y - 200)
	velocidade = VELOCIDADE_INICIAL
	direcao = direcao_aleatoria()
	

func direcao_aleatoria():
	var nova_direcao := Vector2()
	nova_direcao.x = [1, -1].pick_random()
	nova_direcao.y = randf_range(-1, 1)
	return nova_direcao.normalized()
