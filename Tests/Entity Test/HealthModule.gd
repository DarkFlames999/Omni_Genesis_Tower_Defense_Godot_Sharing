extends Node
class_name HealthModule

signal Health_Changed(New_Health: float)
signal Has_Died

@export var Max_Health: float
@onready var Current_Health: float = Max_Health

func Health_Change(amount: float) -> void:
	if Current_Health <= 0:
		return 
	
	Current_Health = clampf(Current_Health - amount, 0, Max_Health)
	Health_Changed.emit(Current_Health)
	
	if Current_Health == 0:
		Entity_Died()

func Entity_Died() -> void:
	Has_Died.emit()
