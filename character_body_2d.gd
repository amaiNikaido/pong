extends CharacterBody2D

var velocidade = 64
var vel = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Cima"):
		position.y -= velocidade * delta
	elif Input.is_action_pressed("Baixo"):
		position.y += velocidade * delta
	
	if Input.is_action_just_pressed("S"):
		Global.cor_raquete += 1
		if Global.cor_raquete > 3:
			Global.cor_raquete = 0
	elif Input.is_action_just_pressed("A"):
		Global.cor_raquete -= 1
		if Global.cor_raquete < 0:
			Global.cor_raquete = 3
	
	$Label.text = str(Global.cor_raquete)
	
	if Global.cor_raquete == Global.cor_bola:
		set_collision_mask_value(1, true)
	elif Global.cor_raquete != Global.cor_bola:
		set_collision_mask_value(1, false)

func _physics_process(delta: float) -> void:
	vel = vel.normalized() * velocidade
	move_and_collide(vel * delta)
