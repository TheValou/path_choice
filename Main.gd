extends Node2D

export (PackedScene) var fourche
export (PackedScene) var aureole
export (int) var hell_score = 0
export (int) var paradise_score = 0
export (bool) var off = false

#func lose_life():
#	lifes -= 1
#	$HUD.update_life(lifes)

func _ready():
	$ItemTimer.start()
	$GlobalTimer.start()
	
	
#	if hell_score == 10 || paradise_score == 10:
#		$bookTimer.stop()
#		$HUD/LifeLabel.visible = false
#		$HUD/ReplayLabel.visible = true
#		$perdu.visible 	= true
#		off = true
#	if Input.is_action_pressed("replay") && off:
#		score = 0
#		lifes = 3
#		gravity = 1
#		$bookTimer.start()
#		$HUD/LifeLabel.visible = true
#		$HUD/ReplayLabel.visible = false
#		$perdu.visible 	= false
#		off = false
#		$HUD.update_score(score)
#		$HUD.update_life(lifes)
#
#func get_gravity():
#	return gravity
#
#func _on_carton_body_entered(body):
#	score += 1
#	$HUD.update_score(score)
#	gravity += 3
#	body.free()
#
#
#func game_over():
#	$bookTimer.stop()
#	$HUD.show_game_over()

func _process(delta):
	if hell_score == 10 || paradise_score == 10:
		$ItemTimer.stop()
		$GlobalTimer.stop()
		$CanvasLayer/EnferLabel.visible = false
		$CanvasLayer/ParadisLabel.visible = false
		$Ghost.visible = false
		$CanvasLayer/ReplayLabel.visible = true
		
		if hell_score == 10:
			$enfer.visible 	= true
		if paradise_score == 10:
			$paradis.visible 	= true
			
		off = true
	if Input.is_action_pressed("replay") && off:
		
		hell_score = 0
		paradise_score = 0
		$ItemTimer.start()
		$GlobalTimer.start()
		$CanvasLayer/EnferLabel.visible = true
		$CanvasLayer/ParadisLabel.visible = true
		$CanvasLayer/ReplayLabel.visible = false
		$Ghost.visible = true
		$paradis.visible 	= false
		$enfer.visible 	= false
		off = false
		$CanvasLayer.update_scores(0, 0)

func _on_ItemTimer_timeout():
	$Path2D/appariton.offset = randi()
	var item1 = fourche.instance()
	add_child(item1)
	item1.connect("evil_high",self,"_on_evil")
	item1.position = $Path2D/appariton.position
	
	$Path2D/appariton.offset = randi()
	var item2 = aureole.instance()
	add_child(item2)
	item2.connect("goodness_high",self,"_on_goodness")
	item2.position = $Path2D/appariton.position
	
func _on_goodness():
	if hell_score > 0:
		hell_score -= 1
	paradise_score +=1
	$CanvasLayer.update_scores(hell_score, paradise_score)
	
func _on_evil():
	if paradise_score > 0:
		paradise_score -= 1
	hell_score +=1
	$CanvasLayer.update_scores(hell_score, paradise_score)
