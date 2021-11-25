extends KinematicBody2D

var tocdo = 200
var trongluc = 10
var chuyendong = Vector2()
var huong_dichuyen = 1

onready var animation = $AnimatedSprite
var dangtancong = false
var bithuong = false

var mau = 20
var satthuong = 10
var dongxu = 0
onready var max_dongxu = get_tree().get_nodes_in_group("dongxu")

func _process(delta):
	$GUI/DongXu.text = "Dong xu: " + str(dongxu)
func _physics_process(delta):
	if !dangtancong and not bithuong:
		huong_dichuyen = Input.get_axis("ui_left","ui_right")
		if huong_dichuyen != 0:
			chuyendong.x = lerp(chuyendong.x,huong_dichuyen * tocdo,0.5)
			animation.play("chay")
			scale.x = scale.y * huong_dichuyen
		else:
			chuyendong.x = lerp(chuyendong.x,0,0.5)
			animation.play("dungyen")

		if is_on_floor():
			if Input.is_action_just_pressed("ui_accept") :
				chuyendong.y = -250
		else:
			animation.play("nhay")
	if Input.is_key_pressed(KEY_J) and is_on_floor():
		if not bithuong:
			dangtancong = true
			chuyendong.x = 0
			animation.play("tancong")
	
	chuyendong.y += trongluc 
	chuyendong.normalized()
	chuyendong = move_and_slide(chuyendong,Vector2.UP) 
	
	if mau <= 0:
		set_physics_process(false)
		animation.play("chet")
		$CollisionShape2D.disabled = true
func _on_AnimatedSprite_animation_finished():
	if animation.animation == "tancong":
		dangtancong = false
	if animation.animation == "bithuong":
		bithuong = false
func _on_AnimatedSprite_frame_changed():
	if animation.animation == "tancong":
		if animation.frame == 3:
			$Hitbox/CollisionShape2D.disabled = false
		else:
			$Hitbox/CollisionShape2D.disabled = true 
		



func _on_Hurtbox_area_entered(area):
	if area.name == "Hitbox" and area.get_parent().dangtancong == true:
		mau -= area.get_parent().satthuong
		dangtancong = false
		bithuong = true
		animation.play("bithuong")
