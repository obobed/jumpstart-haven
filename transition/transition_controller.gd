extends CanvasLayer

signal transitioned_in()
signal transitioned_out()

@onready var overlay: ColorRect = $Overlay
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	overlay.visible = false

func transition_in():
	animation_player.play("in")
	overlay.visible = true
	
func transition_out():
	animation_player.play("out")
	
func transition_to(scene: String):
	transition_in()
	await transitioned_in
	
	var new_scene = load(scene).instantiate()
	var root: Window = get_tree().get_root()
	
	get_tree().current_scene.free()
	
	root.add_child(new_scene)
	
	await get_tree().create_timer(0.5).timeout
	
	transition_out()
	get_tree().current_scene = new_scene
	await transitioned_out

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "in":
		transitioned_in.emit()
	elif anim_name == "out":
		transitioned_out.emit()
