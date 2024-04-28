class_name StateMachine
extends Node


export var states_names = []
export var current_state: String

onready var parent = get_parent()

var states: Dictionary = {}


func add_state(state_name: String, state: State):
	states[state_name] = state
	state.set_parent(parent)
	return state


func add_states_from(states_node: Node):
	for state in states_node.get_children():
		add_state(state.name, state)


func set_state(state_name: String):
	if current_state == state_name:
		return
	if current_state in states:
		states[current_state].exit()
	current_state = state_name
	states[current_state].enter()


func get_state(state_name: String):
	return states[state_name]


func get_current_state():
	return states[current_state]


func run(delta):
	states[current_state].run(delta)
