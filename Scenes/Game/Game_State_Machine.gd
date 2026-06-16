extends Node

enum States {MAIN_MENU, SETTINGS, LOADING, GAME_PLAY, CREDITS, GAME_OVER}
var current_state: States = States.MAIN_MENU

signal state_change(new_state: States)

func change_state(new_state: States) -> void:
	if new_state == current_state:
		return
	else:
		_exit_state(current_state)
		current_state = new_state
		_enter_state(current_state)
		state_change.emit(current_state)

func _exit_state(state: States) -> void:
	match state:
		States.GAME_PLAY:
			get_tree().paused = false

func _enter_state(state: States) -> void:
	match state:
		States.MAIN_MENU:
			get_tree().change_scene_to_file("res://Scenes/UI/main_menu.tscn")
		States.SETTINGS:
			pass
		States.LOADING:
			pass
		States.GAME_PLAY:
			pass
		States.CREDITS:
			pass
		States.GAME_OVER:
			pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_enter_state(States.MAIN_MENU)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
