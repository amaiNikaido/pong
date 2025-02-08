extends StaticBody2D

var velocidade = 64
var posicao_bola : Vector2
var distancia : int
var movimento : int
var win_height : int
var p_height : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_height = get_viewport_rect().size.y
	p_height = 16


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	posicao_bola = $Bola.position
	distancia = position.y - posicao_bola.y
	
	movimento = velocidade*delta
	
	position.y -= movimento
	
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
	
