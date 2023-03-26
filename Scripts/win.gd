extends Node2D

func _ready():
	# Exibe uma mensagem de boas-vindas com o nome do jogador
	$Label.text += str(Global.name_player + " !!")

func _on_Button_pressed():
	# Ao pressionar o botão, volta para a tela inicial do jogo
	get_tree().change_scene("res://Scenas/tela_inicial.tscn")

func _on_next_fase_pressed():
	# Exibe o sprite e o botão da próxima fase
	$Sprite2.visible = true
	$Button.visible = true
