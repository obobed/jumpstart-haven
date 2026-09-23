extends Node

var respawn = Vector2(0,0)
var player_pos = Vector2(0,0)

const quota := 3

signal collected_all

var collected := 0

func add_coin():
	collected += 1
	if collected >= quota:
		collected_all.emit()

func set_player_pos(position: Vector2):
	player_pos = position

func getSpawn():
	print(respawn)
	return respawn
