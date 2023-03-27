extends Node2D

# Função executada quando o nó é criado.
func _ready():
	# Define o número do nível na variável global.
	Global.num_level = "01"
	# Carrega a imagem da vida do jogador com base no número de vidas atual.
	var vidaImg = load(("res://Assets/Menu/Levels/0" + str(Global.vida_player) + ".png")) 
	# Define a textura da imagem da vida do jogador.
	$ParallaxBackground/vida_sprite.texture = vidaImg

# Função executada em cada quadro do jogo.
func _process(delta):
	# Se a vida do jogador acabou.
	if Global.vida_player == 0:
		# Reinicia a vida do jogador.
		Global.vida_player = 3
		# Carrega a cena "less.tscn".
		get_tree().change_scene("res://Scenas/less.tscn")
	
	# Define o valor do texto do rótulo de pontos como a pontuação global convertida em uma string.
	$ParallaxBackground/label_pontos.text = str(Global.pontos) 
	
	# Se o jogador atingir a posição x 1219.
	if $Player.position.x >= 1219:
		# Se a pontuação global for igual a 15.
		if Global.pontos >= 15:
			# Carrega a cena "win.tscn".
			get_tree().change_scene("res://Scenas/win.tscn")
		else:
			# Torna o botão "Volte" visível.
			$Volte.visible = true
	else: 
		# Torna o botão "Volte" invisível.
		$Volte.visible = false
