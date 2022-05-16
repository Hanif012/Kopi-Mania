extends Area2D

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if get_overlapping_bodies().size() > 0:
			$AnimationPlayer.play("credits play")
		
			
#func next_level():
#	var ERR = get_tree().change_scene_to(target_scene)
#
#	if ERR != OK:
#		print("something failed in the door scene")
