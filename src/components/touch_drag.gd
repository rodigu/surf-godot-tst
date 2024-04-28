class_name TouchDrag
extends Node


signal touch_start
signal touch_released


export var history_length = 5


var history = []
onready var pos_modifier = get_viewport().get_visible_rect().size * .5


func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			emit_signal("touch_start")
		else:
			emit_signal("touch_released")


func _process(delta):
	history.append(get_viewport().get_mouse_position() - pos_modifier)
	if len(history) > history_length:
		history.pop_front()


func get_last_position():
	if len(history) == 0:
		return null
	return history[-1]
