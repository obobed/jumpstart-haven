extends CanvasLayer

@onready var slots := [
	$HBoxContainer/CoinSlot1,
	$HBoxContainer/CoinSlot2,
	$HBoxContainer/CoinSlot3
]


const filled_slot = preload("res://assets/items/coin.png")
const empty_slot = preload("res://assets/items/emptyCoin.png")

func _ready() -> void:
	Health.connect("hide_bars", func(): self.visible = false)
	self.visible = true
	
func updateCoins(count: int) -> void:
	for i in range(slots.size()):
		slots[i].texture = filled_slot if i < count else empty_slot
