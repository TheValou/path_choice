extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_scores(evil_score, paradise_score):
	$ParadisLabel.text = "Paradis: " + str(paradise_score) + "/10"
	$EnferLabel.text = "Enfer: " + str(evil_score) + "/10"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
