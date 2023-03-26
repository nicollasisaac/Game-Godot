extends Node2D

# Função executada em cada quadro do jogo.
func _process(delta):
	# Se a variável global indicar que a animação deve ser iniciada.
	if Global.animacao_comecar == true:
		# Move o jogador para a direita.
		$player/texture.position.x += 1
		# Inicia a animação de corrida.
		$player/anim.play("run")
		# Se o jogador atingir a posição x -232.
		if $player/texture.position.x == -232:
			# Define a variável global para parar a animação.
			Global.animacao_comecar = false
			# Carrega a cena "Level_01.tscn".
			get_tree().change_scene("res://Niveis/Levels/Level_01.tscn")

# Função executada quando o botão "play_game" é pressionado.
func _on_play_game_pressed():
	# Define o nome do jogador na variável global.
	Global.name_player = $text_name.text
	# Esconde o campo de texto.
	$text_name.visible = false
	# Esconde o botão de "play_game".
	$play_game.visible = false
	# Esconde a mensagem de boas-vindas.
	$Label.visible = false
	# Define a variável global para iniciar a animação.
	Global.animacao_comecar = true
