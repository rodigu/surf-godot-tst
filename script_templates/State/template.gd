extends State


func _process(delta):
	if not is_active: return


func activate():
	is_active = true


func deactivate():
	is_active = false


func run(delta):
	pass
