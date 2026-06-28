extends Entity2D

func _ready() -> void:
	position = Vector2(100, 300)
	var rect = RectangleShape2D.new()
	rect.size = Vector2(100, 100)
	
	Health_Module.onDamaged.connect(onDamaged)
	onHitTarget.connect(onHit)
	
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(300, 300), 10)
	
	
func onDamaged(amount: float) -> void:
	print("Player suffered ", amount, " units of damage!")
	print("Current Health: ", Health_Module.HP)
	
func onHit(
	hitGroup: HitboxGroup2D,
	targetHurtGroup: HurtboxGroup2D,
	target: Entity2D
) -> void:
	if target == self: return
	target.Health_Module.damage(
		targetHurtGroup.calculateDamage(
			hitGroup.Damage
		)
	)
	
func _process(delta: float) -> void:
	pass
