extends PopupPanel
var screentime = 1



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("P") and visible:
		hide()
	
func p_power_up() -> void:
	pass

func _on_main_ponto() -> void:
	popup()
