extends Area2D

@export var Health_Module : HealthModule 

var tween = create_tween()

func _tween_right() -> void:
	tween.tween_property(self, "position", Vector2(position.x+40, position.y), 10)
	tween.tween_property(self, "rotation", 248, 2) 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Called")
	_tween_right()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
