extends State


var follow


func set_parent(_parent):
	.set_parent(_parent)
	follow = parent.get_node('FollowPoint')


func run(delta):
	var target = parent.get_node('TouchDrag').get_last_position()
	if target == null:
		target = Vector2.ZERO
	parent.position = follow.follow(parent.position, target, delta)

