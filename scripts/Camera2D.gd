extends Camera2D

var lean_amount = 2 * PI / 64
var camera_lean: int = -1

func _process(delta):
	if Input.is_action_pressed("ui_right"):
#		var lean_amount: float = 0
		lean(-lean_amount)
	elif Input.is_action_pressed("ui_left"):
		lean(lean_amount)
	else:
		lean(0, 0.1)


func lean(radians, speed := 0.05) -> void:
	rotation = lerp(rotation, radians, speed)
	zoom.x = lerp(zoom.x, 1 + radians / 2.0, speed * 2)
	zoom.y = lerp(zoom.y, 1 - radians / 2.0, speed * 2)
