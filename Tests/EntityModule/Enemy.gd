extends Entity2D

func _ready() -> void:
	position = Vector2(300, 300)
	var rect = RectangleShape2D.new()
	rect.size = Vector2(100, 100)
	
	var hitboxGroup = createHitboxGroup(10)
	
	hitboxGroup.createHitbox(
		rect,
		Vector2(0, 0),
		true,
		"Hurtbox",
		Color(255, 0, 0, 0.5)
	)
	hitboxGroup.Entity = self
	
	Health_Module.onDamaged.connect(onDamaged)
	onHitTarget.connect(onHit)

func _process(delta: float) -> void:
	pass
	
func onDamaged(amount: float) -> void:
	print("Enemy suffered ", amount, " units of damage!")
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
