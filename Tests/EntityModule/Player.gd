extends Entity2D

func _ready() -> void:
	position = Vector2(100, 300)
	var rect = RectangleShape2D.new()
	rect.size = Vector2(100, 100)
	
	var hurtboxGroup = createHurtboxGroup()
	
	hurtboxGroup.createHurtbox(
		rect,
		Vector2(0, 0),
		true,
		"Hurtbox",
		Color(100, 100, 0, 0.5)
	)
	hurtboxGroup.Entity = self
	
	Health_Module.onDamaged.connect(onDamaged)
	
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(300, 300), 10)
	
	
func onDamaged(amount: float) -> void:
	print("Player suffered ", amount, " units of damage!")
	print("Current Health: ", Health_Module.HP)
	
	
func _process(delta: float) -> void:
	pass
