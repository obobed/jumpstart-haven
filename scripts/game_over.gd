extends Control

signal loaded()

@export_file("*.tscn") var start_scene: String = "res://scenes/level0.tscn"

func _ready() -> void:
	loaded.emit()
	
func _on_restart_pressed() -> void:
	TransitionController.transition_to(start_scene)

func _on_quit_pressed() -> void:
	TransitionController.transition_out()
	await TransitionController.transitioned_out
	await get_tree().create_timer(0.3).timeout
	get_tree().quit()
