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


func lentidao() -> void:
	velocidade = 32
	await get_tree().create_timer(5.0).timeout
	velocidade = 64
	
func trava() -> void:
	piscar()
	set_collision_mask_value(1, false)
	await get_tree().create_timer(3).timeout
	set_collision_mask_value(1, true)

func piscar():
	for i in range(8):  # 8 piscadas
		$Sprite2D.visible = false
		await get_tree().create_timer(0.1).timeout  # Espera 0.1s
		$Sprite2D.visible = true
		await get_tree().create_timer(0.1).timeout  # Espera 0.1s
