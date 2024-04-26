class_name TouchDrag
extends Node

signal touch_start
signal drag(position)
signal touch_released


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event is InputEventMouseMotion:
		emit_signal("drag", event.position)
	if event is InputEventScreenTouch:
		if event.pressed:
			emit_signal("touch_start")
		else:
			emit_signal("touch_released")
