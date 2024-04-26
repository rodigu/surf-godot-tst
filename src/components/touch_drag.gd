class_name TouchDrag
extends Node


signal touch_start
signal drag(position)
signal touch_released

export var history_length = 5

var history = []


func _input(event):
	if event is InputEventMouseMotion:
		emit_signal("drag", event.position)
		history.append(event.position)
	if event is InputEventScreenTouch:
		if event.pressed:
			emit_signal("touch_start")
		else:
			emit_signal("touch_released")
