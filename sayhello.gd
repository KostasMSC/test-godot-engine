extends Panel
var s

#var scene = load("res://Node2D.tscn") # Will load when the script is instanced.

# Preloading it can be more convenient, as it happens at parse time (GDScript only):
var scene = preload("res://Node2D.tscn") # Will load when parsing the script.

var node = scene.instance()


func _ready():
	# connects the Button pressed signal to the Panel
	get_node("Button").connect("pressed", self, "_on_Button_pressed")
	# adds the node to a group
	add_to_group("enemies")
	
	s = Sprite.new() # Create a new sprite!
	add_child(s) # Add it as a child of this node.

func _on_Button_pressed():
	get_node("Label").text = "HELLO!"
	#s.free() # Immediately removes the node from the scene and frees it.
	s.queue_free() # Removes the node from the scene and frees it when it becomes safe to do so.
	add_child(node) # addes Node2D preloaded scene as a child
	
var accum = 0
var text

func _process(delta):
	# auto refresh with each fram passed
	accum += delta
	text = str(accum) # 'text' is a built-in label property.

