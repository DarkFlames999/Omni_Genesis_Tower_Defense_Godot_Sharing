extends Control

##More or less a test script
func _ready() -> void:
	%CheckButton.pressed.connect(_Check_Button_1)
	%CheckButton2.pressed.connect(_Check_Button_2)
	%CheckButton3.pressed.connect(_Check_Button_3)
	%Exit_Button.pressed.connect(_Exit_Button)
	
func _Check_Button_1() -> void:
	%Label.label_settings.outline_size = 4
	%Label.label_settings.outline_color = Color.PURPLE
	
func _Check_Button_2() -> void:
	%Label2.label_settings.outline_size = 3
	%Label2.label_settings.outline_color = Color.RED
	
func _Check_Button_3() -> void:
	%Label3.label_settings.outline_size = 2
	%Label3.label_settings.outline_color = Color.AQUA
	
func _Exit_Button() -> void:
	Main.States.setState("MainMenu")
