extends Control


func _ready():
	%PLAY.pressed.connect(play)
	%SETTINGS.pressed.connect(settings) 
	%QUIT.pressed.connect(quit_game)
	
func play():
	get_tree().change_scene_to_file("res://Scenes/Game/main_game.tscn")
	
func settings():
	get_tree().change_scene_to_file("res://Scenes/UI/Settings_menu.tscn")
	
func quit_game():
	get_tree().quit()
