class_name Entity2D
extends Node2D

# --------- SIGNALS ------------
signal onHitTarget(
	hitGroup: HitboxGroup2D,
	targetHurtGroup: HurtboxGroup2D,
	target: CollisionObject2D
)

# ------------------------------
@export var Health_Module: HealthModule

# -----------------------------

# ------------------------------
func createHurtboxGroup(
	damageMultiplier: float = 1,
	damageAdder: float = 0,
	groupName: String = "HurtboxGroup",
	addToParent: bool = true,
) -> HurtboxGroup2D:
	var hurtboxGroup = HurtboxGroup2D.new(damageMultiplier, damageAdder)
	hurtboxGroup.name = groupName
	
	if addToParent:
		addHurtboxGroup(hurtboxGroup)
	return hurtboxGroup
	
func addHurtboxGroup(hurtboxGroup: HurtboxGroup2D) -> void:
	add_child(hurtboxGroup)

# ------------------------------------------------------------

func createHitboxGroup(
	damage: float,
	groupName: String = "HitboxGroup",
	addToParent: bool = true,
) -> HitboxGroup2D:
	var hitboxGroup = HitboxGroup2D.new(damage)
	hitboxGroup.name = groupName
	
	if addToParent:
		addHitboxGroup(hitboxGroup)
	return hitboxGroup
	
func addHitboxGroup(hitboxGroup: HitboxGroup2D) -> void:
	add_child(hitboxGroup)
