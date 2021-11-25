extends CanvasLayer



onready var level = get_parent().get_node("KhuVucDiChuyen")
func _on_NutLevelKeTiep_pressed():
	get_tree().paused = false
	get_tree().change_scene(level.LevelKeTiep)
	pass # Replace with function body.

func _on_NutChoiLai_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_NutVeMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scences/Map/LevelMap.tscn")
