extends TileMap

var tile = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	erase_cell(2,tile)
	tile = local_to_map(get_local_mouse_position())
	set_cell(2,tile,1,Vector2(0,0),0)
