class_name Health
extends Node

@export var MAX:float = 100
@export var MIN:float = 100
@export var STEP:float = 0.01
@export var value:float = 100

func format(num:float):
	return snappedf(clamp(num,MIN,MAX),STEP)

func add(num:float):
	value = format(num+value)
	return value

func sub(num:float):
	value = format(num-value)
	return value

func set_value(num:float):
	value = format(num)
	return value
