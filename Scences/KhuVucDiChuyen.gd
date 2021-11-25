extends Area2D


export (String,FILE) var LevelKeTiep
onready var endlevelmenu = get_parent().get_node("EndLevelMenu")
var diemso
onready var player = get_parent().get_node("Player")
onready var map = get_parent().name
func _on_KhuVucDiChuyen_body_entered(body):
	if body.name == "Player":
		endlevelmenu.get_node("EndLevelMenu").show()	
		get_tree().paused = true
		PlayerData.Unlocked_map[get_parent().name] = true
		diemso = int( float(player.dongxu /player.max_dongxu.size()) * 100)
		if diemso > PlayerData.diemso[map]: 
			PlayerData.diemso[map] = diemso
		DuLieu.luu_game()
