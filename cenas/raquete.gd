extends StaticBody2D

var velocidade = 64
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	$Label.text = str(Global.cor_raquete)
	checa_botao_press(_delta)
	if Global.cor_raquete == Global.cor_bola:
		collision_mask != ~(1 << 1)
	elif Global.cor_raquete != Global.cor_bola:
		collision_mask &= ~(1 << 1)
		
	

func _physics_process(delta: float) -> void:
	velocity = velocity.normalized() * velocidade
	move_and_collide(velocity * delta)

func checa_botao_press(delt: float) -> void:
	## Função que checa se botões foram pressionados e executa as devidas ações
	
	# Movimento
	if Input.is_action_pressed("Cima"):
		position.y -= velocidade * delt
	elif Input.is_action_pressed("Baixo"):
		position.y += velocidade * delt
	
	# Seleção das cores
	if Input.is_action_just_pressed("S"):
		Global.cor_raquete += 1
		if Global.cor_raquete > 3:
			Global.cor_raquete = 0
	elif Input.is_action_just_pressed("A"):
		Global.cor_raquete -= 1
		if Global.cor_raquete < 0:
			Global.cor_raquete = 3
	
	# Habilidades especiais
	if Input.is_action_just_pressed("P"):
		pass
	elif Input.is_action_just_pressed("O"):
		pass
	elif Input.is_action_just_pressed("N"):
		pass
	elif Input.is_action_just_pressed("G"):
		pass
