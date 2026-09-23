extends Area2D

@onready var coin_bar: CanvasLayer = $"../CoinBar"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("DEBUG: coin++")
		Globals.add_coin()
		# coin_bar.updateCoins(Globals.collected)
		queue_free()
