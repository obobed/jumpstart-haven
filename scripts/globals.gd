extends Node

var respawn = Vector2(0,0)
var player_pos = Vector2(0,0)

const quota := 3

var collected := 0

func add_coin():
	collected += 1
	if collected >= quota:
		TransitionController.transition_to("res://scenes/win.tscn")

func set_player_pos(position: Vector2):
	player_pos = position

func getSpawn():
	print(respawn)
	return respawn
	
func reset():
	collected = 0
	Health.health = 3
