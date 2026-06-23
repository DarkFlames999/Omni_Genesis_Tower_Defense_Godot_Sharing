class_name VarState
extends State

var onEnter: Callable
var onExit: Callable
var update: Callable


func _init(onEnter: Callable, onExit: Callable, update: Callable):
	self.onEnter = onEnter
	self.onExit = onExit
	self.update = update

static func _notCallableError() -> void:
	push_error("Variable is not a valid Callable")
	
static func _callIfExists(callable: Callable, ...args) -> void:
	if callable.is_null() or not callable.is_valid():
		_notCallableError()
		return
	callable.callv(args)


func _onEnter() -> void:
	_callIfExists(onEnter)

func _onExit() -> void:
	_callIfExists(onExit)
	
func _update(delta: float) -> void:
	_callIfExists(update, delta)
	
