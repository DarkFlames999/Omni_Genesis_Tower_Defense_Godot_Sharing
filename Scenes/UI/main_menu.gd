extends Control

func _ready():
	%PLAY.pressed.connect(play)
	%SETTINGS.pressed.connect(settings)
	%CREDITS.pressed.connect(credits) 
	%QUIT.pressed.connect(quit_game)
	
func play():
	print("play button pressed")
	Main.States.setState("Gameplay")
	print(Main.States.stateName())
	
func settings():
	print("settings button pressed")
	Main.States.setState("Settings")
	print(Main.States.stateName())
	
func credits():
	print("credits button pressed")
	Main.States.setState("Credits")
	print(Main.States.stateName())
	
func quit_game():
	get_tree().quit()
