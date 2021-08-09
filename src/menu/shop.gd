extends Control

var premiumsskin = "CenterContainer/VBoxContainer2/CenterContainer/VBoxContainer/premiumskin"

func _ready() -> void:
	$TextureRect/HBoxContainer/premiumCurency.text= String(Global.premium_currency)
	if Global.premium_skin == 1:
		get_node(str(premiumsskin)).set_disabled(true)
		get_node(str(premiumsskin)).set_pressed(true)

func _on_menu_pressed() -> void:
	get_tree().change_scene("res://src/menu/Control.tscn")


func _on_premiumskin_pressed() -> void:
	print("dziala")
	var stan2 = kupSkin()
	if stan2 == true:
		get_node(str(premiumsskin)).set_disabled(true)
		get_node(str(premiumsskin)).set_pressed(true)
		$TextureRect/HBoxContainer/premiumCurency.text= String(Global.premium_currency)
		print("kupiono")
	elif stan2 == false:
		get_node(str(premiumsskin)).set_pressed(false)
		print("nie kupiono")
	
	
func kupSkin() -> bool:
	var stan
	print("kupuje")
	if Global.premium_currency >= 50:
		Global.premium_currency = Global.premium_currency - 50
		Global.savefile("user://Currency.dat", Global.premium_currency)
		Global.savefile("user://premiumskin.dat", 1)
		Global.premium_skin = true
		stan = true
	elif Global.premium_currency < 50:
		stan =  false
	return stan


func _on_buy_pressed() -> void:
	Global.premium_currency = Global.premium_currency + 50
	Global.savefile("user://Currency.dat", Global.premium_currency)
	$TextureRect/HBoxContainer/premiumCurency.text= String(Global.premium_currency)


func _on_premium_smth_pressed() -> void:
	pass # Replace with function body.
