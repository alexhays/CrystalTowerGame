class_name Health
extends Node

@export var max_health:float = 100
@export var min_health:float = 100
@export var health_step:float = 0.01
@export var value:float = 100

func format(num:float):
	return snappedf(clamp(num,min_health,max_health),health_step)

func add(num:float):
	value = format(num+value)
	return value

func sub(num:float):
	value = format(num-value)
	return value

func set_value(num:float):
	value = format(num)
	return value
