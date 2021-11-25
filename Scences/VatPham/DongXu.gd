extends Area2D



func _on_DongXu_body_entered(body):
	if body.name == "Player":
		body.dongxu += 1
		queue_free()
	pass # Replace with function body
