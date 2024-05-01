extends Node2D

@export var map_scale = Vector2(0.2,0.2) # sets the scale for all grid and towers

var active_towers = {}

enum Tower {
	WALL,
	SPIKE,
	# more towers eventually
}

# preload Towers
var WALL_TOWER_SCENE = preload("res://scenes/wall_tower.tscn")
var SPIKE_TOWER_SCENE = preload("res://scenes/spike_tower.tscn")

# list of scenes
var tower_scenes = {
	Tower.WALL: WALL_TOWER_SCENE,
	Tower.SPIKE: SPIKE_TOWER_SCENE,
}

var allowTowerPlacement = true

# current player selected tower
var selectedTower = Tower.WALL

# Called when the node enters the scene tree for the first time.
func _ready():
	$Map.scale = map_scale


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add_tower(type:Tower,pos:Vector2):
	if not active_towers.has(str(pos)):
		var newTower = tower_scenes[type].instantiate()
		add_child(newTower)
		newTower.position = pos
		newTower.scale = map_scale
		active_towers[str(pos)] = {
			"type": type,
			"node": newTower
		}


func remove_tower(pos:Vector2):
	if active_towers.has(str(pos)):
		active_towers[str(pos)]["node"].queue_free()
		active_towers.erase(str(pos))


func _on_map_left_click(posX,posY):
	print('LEFT: ',posX,' - ',posY)
	if allowTowerPlacement:
		add_tower(selectedTower,Vector2(posX,posY))
	


func _on_map_right_click(posX,posY):
	print('RIGHT: ',posX,' - ',posY)
	if allowTowerPlacement:
		remove_tower(Vector2(posX,posY))

# UI menu selected WALL
func _on_tower_menu_wall_selected():
	selectedTower = Tower.WALL
	pass # Replace with function body.

# UI menu selected SPIKE
func _on_tower_menu_spike_selected():
	selectedTower = Tower.SPIKE
	pass # Replace with function body.


func _on_tower_menu_mouse_inside_menu(inside):
	allowTowerPlacement = not inside
	pass # Replace with function body.
