extends Control


func _ready():
#	Global.music = true
#	if Global.music == true:
	Globalscene.get_node("IntroSound3")
	if Global.music == true :
		$music.text = "music"
	if Global.music == false :
		$music.text = "mute"
	
	
func _on_menu_pressed() -> void:
	get_tree().change_scene("res://src/menu/Control.tscn")


func _on_Reset_pressed() -> void:
	Global.savefile("user://maps.dat", 0)
	Global.levels_passed = Global.loadfile("user://maps.dat")

func _on_music_pressed() -> void:
	if Global.music == true :
		Global.music = false
		Globalscene.get_node("IntroSound3").stop()
		$music.text = "mute"
	
	elif Global.music == false :
		Global.music = true
		Globalscene.get_node("IntroSound3").play(0.6)
		$music.text = "music"
