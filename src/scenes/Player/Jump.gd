extends State


signal jump_ended


export var gravity = -50
export var jump_force = 10


var jump_velocity = 0
var initial_scale = Vector2.ONE


func run(delta):
	parent.scale.x += jump_velocity * delta
	parent.scale.y += jump_velocity * delta
	jump_velocity += gravity * delta
	if parent.scale <= initial_scale:
		emit_signal("jump_ended")


func enter():
	jump_velocity = jump_force


func exit():
	parent.scale = initial_scale
