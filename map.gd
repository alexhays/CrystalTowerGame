extends TileMap

signal leftClick(pos)
signal rightClick(pos)

var tile = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	erase_cell(2,tile)
	tile = local_to_map(get_local_mouse_position())
	set_cell(2,tile,1,Vector2(0,0),0)
	var globalPos = to_global(map_to_local(tile))
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		emit_signal("leftClick",globalPos.x,globalPos.y)
	elif Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		emit_signal("rightClick",globalPos.x,globalPos.y)
