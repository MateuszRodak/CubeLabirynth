tool
extends Area2D


onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

export var next_scene: PackedScene
export var actualmap: int

func teleport() -> void:
#	Cutscene.get_node("Admob2").load_interstitial()
	yield(get_tree().create_timer(3.5), "timeout")
	Global.next_scene = next_scene
	Global.actual_level_passed = actualmap
	get_tree().change_scene("res://src/menu/cutscene.tscn")
	
func _on_Finish_body_entered(body: Node) -> void:
	$TPSound.play(0.4)
	teleport()
