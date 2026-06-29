## A Health Module class [br]
## MaxHP: float -> Set in the Inspector [br]
## HP: float -> Sets to MaxHP [br]
## When using HealthModule.new(), do it as: HealthModule.new().fromNew()
## as it would allow for you to initialize values
class_name HealthModule
extends Node

## Signal emits upon setHealth() being called
signal onHealthChanged(previous: float, current: float)

## Signal emits upon heal() being called
signal onHealed(amount: float)

## Signal emits upon damage() being called
signal onDamaged(amount: float)

## Signal emits upon HP == 0
signal onKilled

## Signal emits upon reset() being called
signal onReset


## Max HP is the Maximum Health that the Object can have [br]
## The Minimum is set to 0
@export var MaxHP: float

## The Current Health that the Object can have - Set it to `0` and the Object will be
## considered "killed"
@onready var HP: float = MaxHP


## A helper function for when initializing this Module via .new() instead of from
## the inspector
func fromNew(max: float) -> HealthModule:
	MaxHP = max
	HP = max
	return self

## Set the Health of the object, clamped to the Minimum of 0 and Maximum of the Max Health
## [br] When HP is 0, A signal `onKilled` is emitted
func setHealth(amount: float) -> void:
	var oldHP = HP
	HP = clampf(amount, 0, MaxHP)
	onHealthChanged.emit(oldHP, HP)
	
	
	if oldHP > 0 and HP == 0:
		onKilled.emit()

## Kills the player - Sets HP to 0
func kill() -> void:
	setHealth(0)
		
## Sets HP to Maximum and emits an `onReset` signal
func reset() -> void:
	setHealth(MaxHP)
	onReset.emit()

## Changes health by a value
## (Supposed to be a helper for heal() & damage() without emitting such signals)
func changeHealth(amount: float) -> void:
	setHealth(HP + amount)
	
## Heals the player by a specific amount - Emits an `onHealed` signal
func heal(amount: float) -> void:
	if amount < 0:
		damage(-amount)
		push_warning("Negative Value found for Healing - Use damage() instead")
		return
	
	changeHealth(amount)
	onHealed.emit(amount)
	
## Damages the player by a specific amount - Emits an `onDamaged` signal
func damage(amount: float) -> void:
	if amount < 0:
		heal(-amount)
		push_warning("Negative Value found for Damaging - Use heal() instead")
		return
	changeHealth(-amount)
	onDamaged.emit(amount)


	
