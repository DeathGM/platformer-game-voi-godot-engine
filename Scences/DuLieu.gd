extends Node

const SAVE_PATH = "user://file_dulieu.data"

func luu_game():
	var config = ConfigFile.new()
	config.set_value("player","diemso",PlayerData.diemso)
	config.set_value("player","unlocked_maps",PlayerData.Unlocked_map)
	config.save(SAVE_PATH)

	
func load_game():
	var config = ConfigFile.new()
	var check_file = config.load(SAVE_PATH)
	if check_file != OK: # Neu file khong bi loi hoac khong co
		return  # Huy bo load file
	PlayerData.diemso = config.get_value("player","diemso")
	PlayerData.Unlocked_map = config.get_value("player","unlocked_maps")
	
	
	pass
