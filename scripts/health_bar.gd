extends CanvasLayer

@onready var slots := [
	$HBoxContainer/HealthSlot1,
	$HBoxContainer/HealthSlot2,
	$HBoxContainer/HealthSlot3
]


const filled_slot = preload("res://assets/heart.png")
const empty_slot = preload("res://assets/emptyHeart.png")

func _ready() -> void:
	self.visible = true
	updateHealth()

func updateHealth() -> void:
	var health = Health.health
	for i in range(slots.size()):
		slots[i].texture = filled_slot if i < health else empty_slot
