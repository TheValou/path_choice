extends RigidBody2D
signal evil_high

var timer = null

func origin():
	emit_signal("evil_high")

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


