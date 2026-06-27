## A Set module similar to Python [br]
## An item in a Set cannot exist more than once
class_name Set
extends RefCounted


var _Container: Array[Variant] = []

## Initialize with an already loaded Array or none
func _init(...data: Array[Variant]) -> void:
	var temp = []
	_Container = data.filter(
		func(item: Variant) -> bool:
			if item in temp:
				return false
			
			temp.append(item)
			return true
	)

## Returns the size of the Set
func size() -> int:
	return _Container.size()

## Appends an array and converts it to a Set
func appendArray(...data: Array[Variant]) -> void:
	var temp = []
	_Container.append_array(data)
	_Container = _Container.filter(
		func(item: Variant) -> bool:
			if item in temp:
				return false
			
			temp.append(item)
			return true
	)

## Appends an item, if it exists in the set, do not append
func append(item: Variant) -> void:
	if item in _Container:
		return
		
	_Container.append(item)

## Removes an item from the set, if it does not exist, do not remove
func erase(item: Variant) -> void:
	if item not in _Container:
		return
		
	_Container.erase(item)

## Checks if an item exists in the Set
func has(item: Variant) -> bool:
	return _Container.has(item)

## Convnerts the Set into an Array
func toArray() -> Array[Variant]:
	return _Container.duplicate()

## Clears the Set
func clear() -> void:
	_Container.clear()
