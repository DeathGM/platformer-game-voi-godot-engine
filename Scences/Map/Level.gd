extends Control

export (String) var MapName
export (String,FILE) var Scene
export (String) var Level
onready var ngoisaovang = preload("res://Assets/LevelMap/3 UI/Star1.png")
var SoDiem = 0

func _ready():
	$SoLevel.text = Level
func _process(delta):
	SoDiem = PlayerData.diemso[MapName]
	if SoDiem >= 1 and SoDiem <= 30:
		$NgoiSao1.texture = ngoisaovang
	elif SoDiem >= 30 and SoDiem <= 95:
		$NgoiSao1.texture = ngoisaovang
		$NgoiSao2.texture = ngoisaovang
	elif SoDiem >= 95:
		$NgoiSao1.texture = ngoisaovang
		$NgoiSao2.texture = ngoisaovang
		$NgoiSao3.texture = ngoisaovang


func _on_HinhTron_pressed():
	var level_truocdo = int(Level) - 1
	if MapName != "Map1":
		if PlayerData.Unlocked_map["Map"+ str(level_truocdo)] == true :
			get_tree().change_scene(Scene)
	else: 
		get_tree().change_scene(Scene)

	pass # Replace with function body.
