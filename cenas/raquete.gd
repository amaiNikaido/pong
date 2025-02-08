extends StaticBody2D

var velocidade = 64
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Cima"):
		position.y -= velocidade * delta
	elif Input.is_action_pressed("Baixo"):
		position.y += velocidade * delta

func _physics_process(delta: float) -> void:
	velocity = velocity.normalized() * velocidade
	move_and_collide(velocity * delta)
