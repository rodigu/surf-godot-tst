class_name StateMachine
extends Node


export var states_names = []
export var current_state: String

var states: Dictionary = {}


func add_state(state_name: String, state: Node):
	states[state_name] = state
	return state


func set_state(state_name: String):
	states[current_state].is_active = false
	current_state = state_name
	states[current_state].is_active = true


func get_state(state_name: String):
	return states[state_name]


func get_current_state():
	return states[current_state]
