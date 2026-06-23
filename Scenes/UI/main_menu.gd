extends Control

func _ready():
	%PLAY.pressed.connect(play)
	%SETTINGS.pressed.connect(settings)
	%CREDITS.pressed.connect(credits) 
	%QUIT.pressed.connect(quit_game)
	
func play():
	print("play button pressed")
	GameStateMachine.change_state(GameStateMachine.States.GAME_PLAY)
	print(GameStateMachine.current_state)
	
func settings():
	print("settings button pressed")
	GameStateMachine.change_state(GameStateMachine.States.SETTINGS)
	print(GameStateMachine.current_state)
	
func credits():
	print("credits button pressed")
	GameStateMachine.change_state(GameStateMachine.States.CREDITS)
	print(GameStateMachine.current_state)
	
func quit_game():
	get_tree().quit()
