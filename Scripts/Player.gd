extends KinematicBody2D

# Define as variáveis que serão usadas pelo objeto
var velocity = Vector2.ZERO
var move_speed = 480
var gravity = 1200
var jump_force = -720
var is_grounded
onready var raycasts = $raycasts

func _physics_process(delta: float) -> void:
	# Calcula a velocidade do objeto de acordo com a gravidade e o input do usuário
	velocity.y += gravity * delta
	get_input()
	# Move o objeto e lida com as colisões
	move_and_slide(velocity)
	# Verifica se o objeto está no chão
	is_grounded = _check_is_ground()
	# Define qual animação será executada com base no estado do objeto
	_set_animation()

func get_input():
	velocity.x = 0
	# Verifica o input do usuário e atualiza a velocidade do objeto de acordo com a direção
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.x = lerp(velocity.x, move_speed * move_direction, 0.2)
	
	if move_direction !=0:
		$texture.scale.x = move_direction
		

func _input(event: InputEvent) -> void:
	# Verifica se o usuário apertou o botão de pulo e se o objeto está no chão
	if event.is_action_pressed("jump") and is_grounded:
		velocity.y = jump_force / 2
		
func _check_is_ground():
	# Verifica se o objeto está colidindo com o chão
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true
	return false
	
func _set_animation():
	# Define qual animação será executada com base no estado do objeto
	var anim = "idle"
	
	if !is_grounded:
		anim = "jump"
	elif velocity.x != 0:
		anim = "run"
	
	if $anim.assigned_animation != anim:
		$anim.play(anim)
