class_name State
extends Object

## Called upon entering the State via the State Machine
func _onEnter() -> void: pass

## Called upon exiting the State via the State Machine
func _onExit()  -> void: pass

## Called upon the 'Update' called in the State Machine
func _update(delta: float) -> void: pass
