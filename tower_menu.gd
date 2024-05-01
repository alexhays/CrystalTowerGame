extends CanvasLayer

signal wallSelected
signal spikeSelected
signal mouseInsideMenu(bool)

# Called when the node enters the scene tree for the first time.
func _ready():
	# default wall at start
	_on_wall_tower_pressed()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_wall_tower_pressed():
	emit_signal("wallSelected")
	$VBoxContainer/SpikeTower.modulate = '000000'
	$VBoxContainer/WallTower.modulate = 'ffffff'
	pass # Replace with function body.


func _on_spike_tower_pressed():
	emit_signal("spikeSelected")
	$VBoxContainer/SpikeTower.modulate = 'ffffff'
	$VBoxContainer/WallTower.modulate = '000000'
	pass # Replace with function body.


func _on_v_box_container_mouse_entered():
	emit_signal("mouseInsideMenu",true)
	pass # Replace with function body.


func _on_v_box_container_mouse_exited():
	emit_signal("mouseInsideMenu",false)
	pass # Replace with function body.
