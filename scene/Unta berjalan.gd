extends Area2D


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "player":
			$AnimationPlayer.play("Lompat")
			yield ($AnimationPlayer, "animation_finished")
			$AnimationPlayer.play("Idle")
		else:
			$AnimationPlayer.play("Idle")
	
