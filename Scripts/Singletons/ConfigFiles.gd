extends Node

var config = ConfigFile.new()
const Settings_File_Path = "res://settings.ini"

func _ready() -> void: #sets everything to default for now
	if !FileAccess.file_exists(Settings_File_Path):
		config.set_value("Check_Buttons","Option_1", false )
		config.set_value("Check_Buttons","Option_2", false )
		config.set_value("Check_Buttons","Option_3", false )
	else:
		config.load(Settings_File_Path)

func save_game_settings(key: String, value):
	config.set_value("Check_Buttons", key, value)
	config.save(Settings_File_Path)
	
func load_game_settings():
	var settings_keys = {}
	for key in config.get_section_keys("Check_Buttons"):
		settings_keys[key] = config.get_value("Check_Buttons", key)
	return settings_keys
		
