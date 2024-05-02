class_name HealthBar
extends ProgressBar

@export var health:Health
var label:Label

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(health!=null,"Missing Required Health Component")
	label = Label.new()
	add_child(label)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.size.x = size.x
	label.size.y = size.y
	var fontSize = get_theme_font_size("font_size")
	label.add_theme_font_size_override("font_size",fontSize)
	size.y = label.size.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label.text = str(health.value)+" / "+str(health.max_health)
