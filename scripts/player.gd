extends KinematicBody2D

enum State { STOP, MOVE }
var state = State.MOVE
var raw_bean = 0
const TARGET_FPS = 60
const ACCELERATION = 20
const MAX_SPEED = 150
const FRICTION = 10
const AIR_RESISTANCE = 1
const GRAVITY = 10
const JUMP_FORCE = 500

var spring = -600
var motion = Vector2.ZERO

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer



func _physics_process(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if state != State.MOVE:
		return
		
	if x_input != 0:
		animationPlayer.play("Run")
		motion.x += x_input * ACCELERATION * delta * TARGET_FPS
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
		sprite.flip_h = x_input < 0
		
	else:
		animationPlayer.play("Stand")
	
	motion.y += GRAVITY * delta * TARGET_FPS
	
	if is_on_floor():
		if x_input == 0:
			motion.x = lerp(motion.x, 0, FRICTION * delta)
#			$AudioStreamPlayer2D.play()
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_FORCE
#			$AudioStreamPlayer2D.stop()
	else:
		animationPlayer.play("Jump")
#		$AudioStreamPlayer2D2.play()
		if Input.is_action_just_released("ui_up") and motion.y < -JUMP_FORCE/2:
			motion.y = -JUMP_FORCE/2
			$AnimationPlayer.play("Jump")
		if x_input == 0:
			motion.x = lerp(motion.x, 0, AIR_RESISTANCE * delta)
	
	motion = move_and_slide(motion, Vector2.UP)

	if raw_bean == 7:
		get_tree().change_scene("res://scene/Gameplay 3.tscn")



func play_walk_in_animation():
	state = State.STOP
	$AnimationPlayer.play("DoorIn")

func add_kopi():
	raw_bean = raw_bean + 1


#func _on_AnimationPlayer_animation_finished(anim_name):
#	if anim_name == "Udah 7 kopi":
#		get_tree().paused = false


#func _on_Dialog_timeline_start(timeline_name):
#


func _on_Unta_body_entered(body):
	motion.y = spring
