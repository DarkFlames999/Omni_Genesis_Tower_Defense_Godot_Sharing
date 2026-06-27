## A Hurtbox Group which can recieve a certain amount of damage based on
## the damage that it can absorb (the multiplier) as well as any additional
## damage that it should absorb (the adder) [br]
## when collided with a Hitbox Group [br]
## Can be attached via Inspector / Initialization [br]
## To use Initialization, use .new().fromNew()
class_name HurtboxGroup2D
extends Area2D

## The User of the Hurtbox
@export var Entity: Entity2D

## The amount of damage that is absorbed from the hitbox (in scale) [br]
## Multiplier = 1: Damage from the Hitbox is Damage absorbed [br]
## Multiplier > 1: Absorbs more damage from the Hitbox than the Damage that was set [br]
## 0 < Multiplier < 1: Absorbs less damage from the Hitbox than the Damage that was set [br]
## Multiplier = 0: Absorbs no damage [br]
## Multiplier < 0: Takes the negative?? Basically healing you.
@export var DamageMultiplier: float = 1

## The amount of damage that is absorbed from the hitbox (in adding) [br]
## Adder > 0: Damage absorbed is added by an amount [br]
## Adder = 0: No additional damage is given [br]
## Adder < 0: Less damage is given [br]
@export var DamageAdder: float = 0


var _Hurtboxes: Set = Set.new()

## An initializer helper -> Use with .new() as: .new().fromNew()
func fromNew(entity: Entity2D, dmgMultiplier: float = 1, dmgAdder: float = 0) -> HurtboxGroup2D:
	DamageMultiplier = dmgMultiplier
	DamageAdder = DamageAdder
	Entity = entity
	return self

## Helps to Calculate any damage that is given by the formula: [br]
## [b](damage * multiplier) + adder[\b]
func calculateDamage(damage: float) -> float:
	return (damage * DamageMultiplier) + DamageAdder

## Creates a Hurtbox for Collisions (Automatically adds to Parent if wanted - default 'true') [br]
func createHurtbox(
	shape: Shape2D,
	pos: Vector2,
	addToParent: bool = true,
	nodeName: String = "Hurtbox",
	debugColor: Color = Color(0, 0, 0, 0),
) -> Hurtbox2D:
	var hurtbox = Hurtbox2D.new()
	hurtbox.shape = shape
	hurtbox.position = pos
	hurtbox.debug_color = debugColor
	hurtbox.name = nodeName
	
	if addToParent:
		addHurtbox(hurtbox)
		
	return hurtbox

## Adds a Hurtbox if it doesn't exist in the list already
func addHurtbox(hurtbox: Hurtbox2D) -> void:
	if _Hurtboxes.has(hurtbox): return
	_Hurtboxes.append(hurtbox)
	add_child(hurtbox)
	
## Removes a Hurtbox if it exists
func removeHurtbox(hurtbox: Hurtbox2D) -> void:
	if not _Hurtboxes.has(hurtbox): return
	_Hurtboxes.erase(hurtbox)
	remove_child(hurtbox)

## Returns the list of Hurtboxes
func getHurtboxes() -> Array[Hurtbox2D]:
	return _Hurtboxes.toArray()

## Clears all Hurtboxes
func clear() -> void:
	for hurtbox in getHurtboxes():
		removeHurtbox(hurtbox)
	_Hurtboxes.clear()
	
	
