extends Node2D


export var constant_y = 200


onready var state_machine = $StateMachine


# Called when the node enters the scene tree for the first time.
func _ready():
	state_machine.add_states_from($States)
	state_machine.set_state('Run')
	$States/Jump.initial_scale = scale


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	state_machine.run(delta)
	position.y = constant_y


func _on_TouchDrag_touch_released():
	state_machine.set_state('Jump')
	$PlayerSprite.animation = 'jump'


func _on_Jump_jump_ended():
	state_machine.set_state('Run')
	$PlayerSprite.animation = 'run'
