extends Area2D

var active = false

func _ready():
	connect("body_entered", self, '_on_Baba_body_entered')
	connect("body_exited", self, '_on_Baba_body_exited')

func _process(delta):
	$quest.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			var dialog = Dialogic.start('Misi selesai')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)

func _on_Baba_body_entered(body):
	if body.name == 'player':
		active = true


func _on_Baba_body_exited(body):
	if body.name == 'player':
		active = false

#The func unpause() function needs one additional line:
#active = false
func unpause(timeline_end):
	get_tree().paused = false
	

#func _on_Dialog_dialogic_signal(value):
#	if value == true
#		get_tree().paused = true

#
#func _on_Dialog_timeline_end(timeline_name):
#		get_tree().paused = false
