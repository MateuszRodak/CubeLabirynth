extends Control

var next_scene

func _ready() -> void:
	$AdMob2.load_interstitial()
	$AdMob2.show_interstitial()
	
#func showAd() -> void:
#	$AdMob2.show_interstitial()

func _on_menu_button_pressed() -> void:
	get_tree().change_scene("res://src/menu/Control.tscn")
	Global.music = true
	Globalscene.get_node("IntroSound3").play(0.6)

func _on_next_level_pressed() -> void:
#	if Global.levels_passed >3:
#		showAd()
	$"next level".text = "loading . . ."
	yield(get_tree().create_timer(4.0), "timeout")
	nextlvl()
	
func _on_interstitial_close() -> void:
	nextlvl()

func _enter_tree() -> void:
	next_scene = Global.next_scene
	if Global.actual_level_passed > Global.levels_passed :
		Global.levels_passed = Global.actual_level_passed
		Global.savefile("user://maps.dat", String(Global.actual_level_passed))
#	print("actual:")
#	print(Global.actual_level_passed)
#	print("stan")
#	print(Global.levels_passed)
	Global.current_scene = Global.next_scene

func nextlvl() -> void:
	get_tree().change_scene_to(next_scene)
	
