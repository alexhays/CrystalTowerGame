class_name Damagebox
extends Area2D

signal hitArea(area:Hitbox)
signal missedArea(area:Hitbox)
@export var Damage = 10

func _process(delta):
	var areas = get_overlapping_areas()
	for area:Hitbox in areas:
		var success = area.hit(Damage)
		if success:
			emit_signal("hitArea",area)
		else:
			emit_signal("missedArea",area)


