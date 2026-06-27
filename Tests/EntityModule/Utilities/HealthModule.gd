class_name HealthModule
extends Node


signal onHealthChanged(previous: float, current: float)
signal onHealed(amount: float)
signal onDamaged(amount: float)
signal onKilled
signal onReset


@export var MaxHP: float = 100
@onready var HP: float = MaxHP

func setHealth(amount: float) -> void:
	var oldHP = HP
	HP = clampf(amount, 0, MaxHP)
	onHealthChanged.emit(oldHP, HP)
	
	if oldHP > 0 and HP == 0:
		onKilled.emit()
		
func kill() -> void:
	setHealth(0)
		
func reset() -> void:
	setHealth(MaxHP)
	onReset.emit()
	
func changeHealth(amount: float) -> void:
	setHealth(HP + amount)
	
func heal(amount: float) -> void:
	if amount < 0:
		damage(-amount)
		push_warning("Negative Value found for Healing - Use damage() instead")
		return
	
	setHealth(HP + amount)
	onHealed.emit(amount)
	
func damage(amount: float) -> void:
	if amount < 0:
		heal(-amount)
		push_warning("Negative Value found for Damaging - Use heal() instead")
		return
	setHealth(HP - amount)
	onDamaged.emit(amount)


	
