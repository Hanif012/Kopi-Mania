extends KinematicBody2D

signal unta_jalan_entered()

var speed = 200
var motion = Vector2()
var gravity = 20
var direction = 1 # 1 == kanan dan -1 == kiri

func _physics_process(delta):
	motion.y += gravity
	motion.x += speed * direction
	if is_on_wall():
		direction = direction * -1
		_rotate_unta()
#		print("flipppps")
#	if direction == -1:
#		scale.x = -1
#		print("ss")
	motion = move_and_slide(motion)
	
func _rotate_unta():
	if position.x < 0:
		$Area2D/Sprite.flip_h = true

func _on_Area2D_body_entered(body):
	emit_signal("unta_jalan_entered")
