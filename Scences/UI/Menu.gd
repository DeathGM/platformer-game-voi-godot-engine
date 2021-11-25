extends Control



func _ready():
	DuLieu.load_game()

func _on_NutBatDau_pressed():
	$AudioStreamPlayer2D.play()
	yield(get_tree().create_timer(0,1),"timeout")
	get_tree().change_scene("res://Scences/Map/LevelMap.tscn")
	pass # Replace with function body.


func _on_NutThoatGame_pressed():
	get_tree().quit()
	pass # Replace with function body.
