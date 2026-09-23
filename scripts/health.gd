extends Node

@export_file("*.tscn") var end_screen = "res://scenes/gameOver.tscn"

var health = 3: # the starting amount of health
	set(h):
		health = h
		check_health()

func check_health():
	if health < 1:
		health = 3
		TransitionController.transition_to(end_screen)
