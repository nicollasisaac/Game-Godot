extends Node2D 

# Função executada quando a cena é carregada.
func _ready():  
	# Substituir pelo código a ser executado.
	pass 

# Função executada quando o botão é pressionado.
func _on_Button_pressed():
	# Define a variável global para iniciar a animação.
	Global.animacao_comecar = true 

# Função executada em cada quadro do jogo.
func _process(delta):
	# Se a variável global indicar que a animação deve ser iniciada.
	if Global.animacao_comecar == true:  
		# Move o jogador para a direita.
		$player/texture.position.x += 1  
		# Inicia a animação de corrida.
		$player/anim.play("run")  
		# Esconde o botão.
		$Button.visible = false  
		# Esconde as instruções.
		$instrucao.visible = false  
		# Esconde a mensagem de sobrevivência.
		$sobreviva.visible = false  
		# Se o jogador atingir a posição x -232.
		if $player/texture.position.x == -232:  
			# Define a variável global para parar a animação.
			Global.animacao_comecar = false  
			# Carrega a cena "get_name.tscn".
			get_tree().change_scene("res://Scenas/get_name.tscn")  

# Função executada quando o botão de sair das instruções é pressionado.
func _on_sair_intrucao_pressed():
	# Mostra o jogador.
	$player.visible = true  
	# Mostra o botão.
	$Button.visible = true  
	# Mostra a mensagem de sobrevivência.
	$sobreviva.visible = true  
	# Mostra as instruções.
	$instrucao.visible = true  
	# Esconde o controle.
	$Control.visible = false  

# Função executada quando o botão de instruções é pressionado.
func _on_instrucao_pressed():
	# Esconde a mensagem de sobrevivência.
	$sobreviva.visible = false  
	# Esconde o jogador.
	$player.visible = false  
	# Esconde o botão.
	$Button.visible = false  
	# Esconde as instruções.
	$instrucao.visible = false  
	# Mostra o controle.
	$Control.visible = true  
