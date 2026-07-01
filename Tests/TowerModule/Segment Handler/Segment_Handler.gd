class_name SegmentHandler
extends Node

var Segment_Array : Array
const Max_Foundation_Segment_Count : int = 1
const Max_Turret_Segment_Count : int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

## Create a tower Segment (With an option to add it automatically - default is true)
func CreateTowerSegment(
	towertype: String,
	pos: Vector2 = Vector2(),
	addToParent: bool = true,
	nodeName: String = "Segment",
	debugColor: Color = Color(0, 0, 0, 0),
) -> Segment:
	var segment = Segment.new()
	segment.Tower_Type = towertype
	segment.position = pos
	segment.debug_color = debugColor
	segment.name = nodeName
	
	if addToParent:
		AddTowerSegment(segment)
		
	StackTowerSegment(segment)
		
	return segment

## Adds a segment to the node, only if it isn't added yet
func AddTowerSegment(segment: Segment) -> void:
	if Segment_Array.has(segment): return
	Segment_Array.append(segment)
	add_child(segment)
	
func RemoveTowerSegment(segment: Segment) -> void:
	if not Segment_Array.has(segment): return
	Segment_Array.erase(segment)
	remove_child(segment)

func StackTowerSegment(segment: Segment) -> void:
	match segment.Tower_Type:
		segment.Tower_Type.Structural:
			var Foundation_Segment = Segment_Array.filter(func (segment): return segment.Tower_Type == segment.Tower_Type.Foundation)
			if Foundation_Segment.is_empty(): return #Makes sure there is a foundation piece
			segment.position.y 
			
		segment.Tower_Type.Turret:
			pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
