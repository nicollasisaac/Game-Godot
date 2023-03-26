extends Area2D


func _on_Items_body_entered(body):
	$anim.play("collected")
	Global.pontos += 1


func _on_anim_animation_finished(anim_name):
	if anim_name == "collected":
		queue_free()
