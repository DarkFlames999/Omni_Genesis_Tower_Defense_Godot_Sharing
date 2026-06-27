class_name HitboxGroup2D
extends Area2D

@export var Entity: Entity2D
@export var Damage: float

var _Hitboxes: Set = Set.new()


func _init(damage: float) -> void:
	Damage = damage
	area_entered.connect(
		func(area: Area2D) -> void:
			if is_instance_of(area, HurtboxGroup2D):
				Entity.onHitTarget.emit(self, area, area.Entity)
	)

func createHitbox(
	shape: Shape2D,
	pos: Vector2,
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
	
func addHitbox(hitbox: Hitbox2D) -> void:
	_Hitboxes.append(hitbox)
	add_child(hitbox)
	
func removeHitbox(hitbox: Hitbox2D) -> void:
	_Hitboxes.erase(hitbox)
	remove_child(hitbox)
	
func getHitboxes() -> Array[Hitbox2D]:
	return _Hitboxes.toArray()
	
func clear() -> void:
	for hitbox in _Hitboxes:
		removeHitbox(hitbox)
	_Hitboxes.clear()
	
	
