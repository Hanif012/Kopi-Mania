extends Area2D

func _on_raw_bean_body_entered(body):
	$AnimationPlayer.play("Hit")
	body.add_kopi()


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
