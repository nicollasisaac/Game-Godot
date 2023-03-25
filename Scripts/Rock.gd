extends KinematicBody2D

export var speed = 64
export var health = 1
var velocity = Vector2.ZERO
var move_direction = -1
var gravity = 1200
onready var hurtbox_col = get_node("hurtbox/collision")

func _physics_process(delta):
	velocity.x = speed * move_direction
	velocity.y += gravity * delta
	
	if move_direction == 1:
		$texture.flip_h = true
	else:
		$texture.flip_h = false
	
	if $ray_wall.is_colliding():
		$anim.play("Idle")

	velocity = move_and_slide(velocity)

func _on_anim_animation_finished(anim_name):
	if anim_name == "Idle":
		$texture.flip_h != $texture.flip_h
		$ray_wall.scale.x *= -1
		move_direction *= -1
		$anim.play("run")
