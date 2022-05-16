extends CanvasLayer

export(PackedScene) var target_scene

func _on_Button_pressed():
	get_tree().change_scene_to(target_scene)

func _on_Button2_pressed():
		get_tree().quit()
