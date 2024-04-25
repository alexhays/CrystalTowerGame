extends Node2D

@export var map_scale = Vector2(0.2,0.2) # sets the scale for all grid and towers

var active_towers = {}

enum Tower {
	SPIKE,
	# more towers eventually
}

var SPIKE_TOWER_SCENE = preload("res://spike_tower.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Map.scale = map_scale


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add_tower(type:Tower,pos:Vector2):
	if not active_towers.has(str(pos)):
		var newTower = SPIKE_TOWER_SCENE.instantiate()
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
	add_tower(Tower.SPIKE,Vector2(posX,posY))
	


func _on_map_right_click(posX,posY):
	print('RIGHT: ',posX,' - ',posY)
	remove_tower(Vector2(posX,posY))
