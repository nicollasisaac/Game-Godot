extends Area2D

# Função chamada quando um corpo entra em contato com a área
func _on_fallzone_body_entered(body):
	# Diminui a vida do jogador em 1
	Global.vida_player -= 1
	# Reinicia a contagem de pontos
	Global.pontos = 0
	# Recarrega a cena atual
	get_tree().reload_current_scene()
