class_name HealthBar
extends ProgressBar

@export var health:Health
var label:Label

# Called when the node enters the scene tree for the first time.
func _ready():
	#assert(health!=null,"Missing Required Health Component")
	label = Label.new()
	add_child(label)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.size.x = size.x
	label.size.y = size.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label.text = str(health.value)+" / "+str(health.max_health)
