class_name Entity2D
extends Node2D

# --------- SIGNALS ------------
## Emits when one of your Hitboxes collides with a Hurtbox
## [br] You HIT Target
## [br] NOTE: CAN INCLUDE YOUR HURTBOX
signal onHitTarget(
	hitGroup: HitboxGroup2D,
	targetHurtGroup: HurtboxGroup2D,
	target: CollisionObject2D
)

## Emits when one of your Hurtboxes collides with a Hitbox
## [br] Target HITS You
## [br] NOTE: CAN INCLUDE YOUR HITBOX
signal onHurtByTarget(
	hurtGroup: HurtboxGroup2D,
	targetHitGroup: HitboxGroup2D,
	target: CollisionObject2D
)

# ------------------------------
## The Health Module of an Entity - Can be initialized or set in the Inspector
@export var Health_Module: HealthModule

# -----------------------------
var _Hitboxes:  Set = Set.new()
var _Hurtboxes: Set = Set.new()

# ------------------------------
## Create a Hurtbox Group
func createHurtboxGroup(
	damageMultiplier: float = 1,
	damageAdder: float = 0,
	groupName: String = "HurtboxGroup",
	addToParent: bool = true,
) -> HurtboxGroup2D:
	var hurtboxGroup = HurtboxGroup2D.new().fromNew(self, damageMultiplier, damageAdder)
	hurtboxGroup.name = groupName
	
	if addToParent:
		addHurtboxGroup(hurtboxGroup)
	return hurtboxGroup
	
## Adds a Hurtbox Group if it doesn't exist in the Entity yet
func addHurtboxGroup(hurtboxGroup: HurtboxGroup2D) -> void:
	if _Hurtboxes.has(hurtboxGroup): return
	_Hurtboxes.append(hurtboxGroup)
	add_child(hurtboxGroup)

## Removes a Hurtbox Group if it exists in the Entity
func removeHurtboxGroup(hurtboxGroup: HurtboxGroup2D) -> void:
	if not _Hurtboxes.has(hurtboxGroup): return
	_Hurtboxes.erase(hurtboxGroup)
	remove_child(hurtboxGroup)

## Gets all Hurtbox Groups of Entity
func getHurtboxGroups() -> Array[HurtboxGroup2D]:
	return _Hurtboxes.toArray()

## Removes all Hurtbox Groups of Entity
func clearHurtboxGroups() -> void:
	for hurtboxGroup in getHurtboxGroups():
		removeHurtboxGroup(hurtboxGroup)
	_Hurtboxes.clear()

# ------------------------------------------------------------

## Creates a Hitbox Group with a certain amount of Damage
func createHitboxGroup(
	damage: float,
	groupName: String = "HitboxGroup",
	addToParent: bool = true,
) -> HitboxGroup2D:
	var hitboxGroup = HitboxGroup2D.new().fromNew(self, damage)
	hitboxGroup.name = groupName
	
	if addToParent:
		addHitboxGroup(hitboxGroup)
	return hitboxGroup

## Adds a Hitbox Group if it doesn't exist in the Entity yet
func addHitboxGroup(hitboxGroup: HitboxGroup2D) -> void:
	if _Hitboxes.has(hitboxGroup): return
	_Hitboxes.append(hitboxGroup)
	add_child(hitboxGroup)

## Removes a Hitbox Group if it exists in the Entity
func removeHitboxGroup(hitboxGroup: HitboxGroup2D) -> void:
	if not _Hitboxes.has(hitboxGroup): return
	_Hitboxes.erase(hitboxGroup)
	remove_child(hitboxGroup)

## Gets all Hurtbox Groups of Entity
func getHitboxGroups() -> Array[HitboxGroup2D]:
	return _Hitboxes.toArray()

## Removes all Hurtbox Groups of Entity
func clearHitboxGroups() -> void:
	for hitboxGroup in getHitboxGroups():
		removeHitboxGroup(hitboxGroup)
	_Hitboxes.clear()
