extends Control

func _ready():
	%PLAY.pressed.connect(play)
	##Incomplete
	%SETTINGS.pressed.connect() 
	
	%QUIT.pressed.conneect(quit_game)
	
func play():
	get_tree().change_scene_to_file("res://Scenes/Game/main_game.tscn")
	
func settings():
	pass
	
func quit_game():
	get_tree().quit()
