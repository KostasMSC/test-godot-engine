extends Node2D

var click_counter_label

const TIMER_LIMIT = 2.0
var timer = 0.0
var counter = 0

var title = "Game v0.1"

# Another way to instance a variable with adding it to the ready function
onready var fps_label = get_node('Label')

func _process(delta):
	# Shows FPS in title window
	OS.set_window_title(title + " | fps: " + str(Engine.get_frames_per_second()))
	
	# Shows FPS in Label
	fps_label.set_text(str(Engine.get_frames_per_second()))
	
	# Shows FPS in output panel every 2 seconds
	timer += delta
	if timer > TIMER_LIMIT: # Prints every 2 seconds
		timer = 0.0
		print("fps: " + str(Engine.get_frames_per_second()))

# Called when the node enters the scene tree for the first time.
func _ready():
	click_counter_label = get_node('ClickCounter')

func _on_Button_button_down():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var i = rng.randi_range(100, 1000)
	$Button.set_position(Vector2(i,randi()%10))
	counter += 1
	click_counter_label.set_text('Times Clicked: ' + str(counter))

