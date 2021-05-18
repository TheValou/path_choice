extends RigidBody2D
signal goodness_high

var timer = null
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func origin():
	emit_signal("goodness_high")
	
# Called when the node enters the scene tree for the first time.

func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.set_one_shot(true)
	timer.start(1)
	timer.connect("timeout", self, "on_timeout")

func on_timeout():
	remove_child(timer)
	self.queue_free()
	timer.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
