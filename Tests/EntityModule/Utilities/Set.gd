class_name Set
extends RefCounted


var _Container: Array[Variant] = []


func _init(...data: Array[Variant]) -> void:
	var temp = []
	_Container = data.filter(
		func(item: Variant) -> bool:
			if item in temp:
				return false
			
			temp.append(item)
			return true
	)
	
func size() -> int:
	return _Container.size()
	
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
	
func append(item: Variant) -> void:
	if item in _Container:
		return
		
	_Container.append(item)
	
func erase(item: Variant) -> void:
	if item not in _Container:
		return
		
	_Container.erase(item)
	
func has(item: Variant) -> bool:
	return _Container.has(item)
	
func toArray() -> Array[Variant]:
	return _Container.duplicate()
	
func clear() -> void:
	_Container.clear()
