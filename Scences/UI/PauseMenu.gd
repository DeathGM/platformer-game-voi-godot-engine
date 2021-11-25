extends CanvasLayer



func _on_NutTiepTuc_pressed():
	get_tree().paused = false
	$PauseMenu.hide()



func _on_NutChoiLai_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	print("choi lai")
	pass # Replace with function body.


func _on_NutVeMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scences/Map/LevelMap.tscn")
	pass # Replace with function body.


func _on_HienPauseMenu_pressed():
	
	get_node("AudioStreamPlayer2D").play()
	$PauseMenu.show()
	get_tree().paused = true
	pass # Replace with function body.
