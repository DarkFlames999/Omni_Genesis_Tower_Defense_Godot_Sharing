class_name StateMachine
extends Object

var _Current: String = ""
var _States: Dictionary[String, State] = {}
signal onStateChanged(previous: String, current: String)

static func _overrideError(name: String) -> void:
	push_error(["Cannot allow State overriding of '",name,"' if State is currently active"])

static func _notExistsError(name: String) -> void:
	push_error([
		"State `", name,
		"` Does not exist in States"
	])



## Create a State Machine with loaded states
func _init(states: Dictionary[String, State]) -> void:
	_States = states


func stateName() -> String:
	return _Current
	
func state() -> State:
	return getState(_Current)


## Adds a state to the Machine - Select it with `setState()`
func addState(name: String, state: State) -> void:
	if name in _States and name == _Current:
		_overrideError(name)
		return
	_States[name] = state

## Removes a state from the machine with `name` - Cannot be removed whilst State currently active
func removeState(name: String) -> void:
	if name not in _States:
		_notExistsError(name)
		return
	_States.erase(name)
	
func addRawState(name: String, onEnter: Callable, onExit: Callable, update: Callable) -> void:
	addState(name, VarState.new(onEnter, onExit, update))
	
func setState(name: String) -> void:
	if name not in _States:
		_notExistsError(name)
		return
		
	if state() != null:
		state()._onExit()
		
	onStateChanged.emit(_Current, name)
	
	_Current = name
	state()._onEnter()
	

func getState(name: String) -> State:
	return _States.get(name, null)
	
