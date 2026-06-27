class_name HurtboxGroup2D
extends Area2D

@export var Entity: Entity2D
@export var DamageMultiplier: float = 1
@export var DamageAdder: float = 0


var _Hurtboxes: Set = Set.new()

func _init(dmgMultiplier: float = 1, dmgAdder: float = 0) -> void:
	DamageMultiplier = dmgMultiplier
	DamageAdder = DamageAdder
	
func calculateDamage(damage: float) -> float:
	return (damage * DamageMultiplier) + DamageAdder

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
	
func addHurtbox(hurtbox: Hurtbox2D) -> void:
	_Hurtboxes.append(hurtbox)
	add_child(hurtbox)
	
func removeHurtbox(hurtbox: Hurtbox2D) -> void:
	_Hurtboxes.erase(hurtbox)
	remove_child(hurtbox)
	
func getHurtboxes() -> Array[Hurtbox2D]:
	return _Hurtboxes.toArray()
	
func clear() -> void:
	for hurtbox in _Hurtboxes:
		removeHurtbox(hurtbox)
	_Hurtboxes.clear()
	
	
