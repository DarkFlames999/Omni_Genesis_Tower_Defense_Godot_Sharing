## A Hitbox Group which can deal a certain amount of damage
## when collided with a Hurtbox Group [br]
## Can be attached via Inspector / Initialization [br]
## To use Initialization, use .new().fromNew()
class_name HitboxGroup2D
extends Area2D

## The User of the Hitbox Group
@export var Entity: Entity2D

## The Damage of the Hitbox Group
@export var Damage: float

var _Hitboxes: Set = Set.new()

## Use this in hand with the .new() initialization
func fromNew(entity: Entity2D, damage: float) -> HitboxGroup2D:
	Damage = damage
	Entity = entity
	return self

func _ready() -> void:
	area_entered.connect(
		func(area: Area2D) -> void:
			if is_instance_of(area, HurtboxGroup2D):
				Entity.onHitTarget.emit(self, area, area.Entity)
	)

## Create a hitbox (With an option to add it automatically - default is true)
func createHitbox(
	shape: Shape2D,
	pos: Vector2 = Vector2(),
	addToParent: bool = true,
	nodeName: String = "Hitbox",
	debugColor: Color = Color(0, 0, 0, 0),
) -> Hitbox2D:
	var hitbox = Hitbox2D.new()
	hitbox.shape = shape
	hitbox.position = pos
	hitbox.debug_color = debugColor
	hitbox.name = nodeName
	
	if addToParent:
		addHitbox(hitbox)
		
	return hitbox

## Adds a hitbox to the node, only if it isn't added yet
func addHitbox(hitbox: Hitbox2D) -> void:
	if _Hitboxes.has(hitbox): return
	_Hitboxes.append(hitbox)
	add_child(hitbox)

## Removes a hitbox from the node, if it has already been added
func removeHitbox(hitbox: Hitbox2D) -> void:
	if not _Hitboxes.has(hitbox): return
	_Hitboxes.erase(hitbox)
	remove_child(hitbox)

## Returns an array of hitboxes
func getHitboxes() -> Array[Hitbox2D]:
	return _Hitboxes.toArray()

## Clears all hitboxes
func clear() -> void:
	for hitbox in getHitboxes():
		removeHitbox(hitbox)
	_Hitboxes.clear()
	
	
