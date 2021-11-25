extends KinematicBody2D

# Di chuyn
var tocdo = 80
var trongluc = 10
var chuyendong = Vector2()
var huong_dichuyen = 1
# Animation
onready var animation = $AnimatedSprite
var dangtancong = false
var bithuong = false
# Chi so
var mau = 30
var satthuong = 5

func _physics_process(delta):
	
	if dangtancong == false and bithuong == false :
		chuyendong.x = tocdo * huong_dichuyen
		chuyendong.y += trongluc
		chuyendong = move_and_slide(chuyendong,Vector2.UP)
		animation.play("dichuyen")
		
		if $RayCast2D.is_colliding() == false:
			huong_dichuyen = huong_dichuyen * -1
			scale.x = scale.y * huong_dichuyen
		
		if is_on_wall() and $XacDinhPlayer.is_colliding() == false:
			huong_dichuyen = huong_dichuyen * -1
			scale.x = scale.y * huong_dichuyen
	var coll = $XacDinhPlayer.get_collider()
	if coll != null and coll.name == "Player" and dangtancong == false :
		if not bithuong:
			dangtancong = true
			animation.play("tancong")
	if mau <= 0:
		animation.play("chet")


func _on_AnimatedSprite_animation_finished():
	if animation.animation == "tancong":
		dangtancong = false
	if animation.animation == "chet":
		queue_free()
	if animation.animation == "bithuong":
		bithuong = false

func _on_Hurtbox_area_entered(area):
	if area.get_parent().name == "Player" and area.get_parent().dangtancong == true:
		mau -= area.get_parent().satthuong
		bithuong = true
		dangtancong = false
		animation.play("bithuong")



func _on_AnimatedSprite_frame_changed():
	if animation.animation == "tancong":
		if animation.frame == 3:
			$Hitbox/CollisionShape2D.disabled = false
		else:
			$Hitbox/CollisionShape2D.disabled = true

