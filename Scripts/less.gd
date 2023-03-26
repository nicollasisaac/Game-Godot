extends Node2D

# Função executada quando o script é carregado. Define o texto do aviso e zera a pontuação global.
func _ready():
	$aviso_text.text = (Global.name_player + " você perdeu todas suas vidas")
	Global.pontos = 0

# Função executada quando o botão "start" é pressionado. Altera a cena atual para a cena do nível atual.
func _on_start_pressed():
	get_tree().change_scene(("res://Niveis/Levels/Level_" + Global.num_level + ".tscn"))
