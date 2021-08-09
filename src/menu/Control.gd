extends Control

#func _init() -> void:
#	$AdMob.load_interstitial()
#	Cutscene.get_node("Admob2").load_interstitial()
#	$AdMob.load_banner()
	
func _ready():	
	$AdMob.load_banner()
	$AdMob.show_banner()
	Globalscene.get_node("IntroSound3")
#	if Global.music == true:
#		$IntroSound3.play()
	#levels_passed.load()
#	Global.levels_passed = int(Global.loadfile("user://maps.dat"))
#	Global.premium_currency = int(Global.loadfileP())
#	print(Global.levels_passed)

func showAd() -> void:
	$AdMob.show_interstitial()

func _on_BOption_pressed() -> void:
	get_tree().change_scene("res://src/menu/optionscene.tscn")

func _on_Bexit_pressed() -> void:
	get_tree().quit()

func _on_Start_pressed() -> void:
	$AdMob.hide_banner()
	Globalscene.get_node("IntroSound3").stop()
	var tutaj = str("res://src/MAPY/Map_",Global.levels_passed+1,".tscn")
	get_tree().change_scene(tutaj)

func _on_Maps_pressed() -> void:
	$AdMob.hide_banner()
	get_tree().change_scene("res://src/menu/mapsy.tscn")


func _on_Shop_pressed() -> void:
	$AdMob.hide_banner()
	get_tree().change_scene("res://src/menu/shop.tscn")
