class_name Main
extends Node


class NodeState extends State:
	func getTree() -> SceneTree:
		return Engine.get_main_loop()
	
	func changeSceneTo(path: String) -> void:
		getTree().change_scene_to_file(path)
		
class _MainMenu extends NodeState:
	func _onEnter() -> void:
		changeSceneTo("res://Scenes/UI/main_menu.tscn")

class _Settings extends NodeState:
	func _onEnter() -> void:
		changeSceneTo("res://Scenes/UI/Settings_menu.tscn")
		
class _Gameplay extends NodeState:
	func _onEnter() -> void:
		changeSceneTo("res://Scenes/Game/main_game.tscn")
		
class _Credits extends NodeState:
	func _onEnter() -> void:
		changeSceneTo("res://Scenes/UI/credits_menu.tscn")
		
class _Test extends  NodeState:
	func _onEnter() -> void:
		changeSceneTo("res://Tests/EntityModule/TestScene.tscn")

static var States = StateMachine.new({
	"MainMenu": 	_MainMenu.new(),
	"Settings": _Settings.new(),
	"Gameplay": _Gameplay.new(),
	"Credits" : _Credits .new(),
	"Test"    : _Test.new()
})
