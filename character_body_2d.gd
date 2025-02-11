extends CharacterBody2D

var velocidade = 64
var vel = Vector2.ZERO
var troca = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Cima"):
		position.y -= velocidade * delta
	elif Input.is_action_pressed("Baixo"):
		position.y += velocidade * delta
	
	if Input.is_action_just_pressed("S") and troca == false:
		Global.cor_raquete += 1
		if Global.cor_raquete > 3:
			Global.cor_raquete = 0
	elif Input.is_action_just_pressed("A") and troca == false:
		Global.cor_raquete -= 1
		if Global.cor_raquete < 0:
			Global.cor_raquete = 3
			
	if troca:
		set_collision_mask_value(1, true)
		if Global.cor_bola == 0:
			$Sprite2D.texture = load("res://sprites/raquetes/raquete1.png")
		elif  Global.cor_bola == 1:
			$Sprite2D.texture = load("res://sprites/raquetes/raquete2.png")
		elif  Global.cor_bola == 2:
			$Sprite2D.texture = load("res://sprites/raquetes/raquete3.png")
		elif  Global.cor_bola == 3:
			$Sprite2D.texture = load("res://sprites/raquetes/raquete4.png")
	
	$Label.text = str(Global.cor_raquete)
	if Global.cor_raquete == 0:
		$Sprite2D.texture = load("res://sprites/raquetes/raquete1.png")
	elif  Global.cor_raquete == 1:
		$Sprite2D.texture = load("res://sprites/raquetes/raquete2.png")
	elif  Global.cor_raquete == 2:
		$Sprite2D.texture = load("res://sprites/raquetes/raquete3.png")
	elif  Global.cor_raquete == 3:
		$Sprite2D.texture = load("res://sprites/raquetes/raquete4.png")
	
	if Global.cor_raquete == Global.cor_bola:
		set_collision_mask_value(1, true)
	elif Global.cor_raquete != Global.cor_bola:
		set_collision_mask_value(1, false)

func _physics_process(delta: float) -> void:
	vel = vel.normalized() * velocidade
	move_and_collide(vel * delta)

func aumento() -> void:
	$Sprite2D.scale *= Vector2(1.3, 1)
	$CollisionShape2D.shape.size *= Vector2(1.3, 1)
	
func _troca():
	troca = true
	await get_tree().create_timer(5.0).timeout
	troca = false
