extends Control	

var adres1 = "CenterContainer/VBoxContainer/mapytutorial/VBoxContainer/LVL"
var adres2 = "CenterContainer/VBoxContainer/mapy 15x15/VBoxContainer/LVL"
var adres3 = "CenterContainer/VBoxContainer/mapy 30x30/VBoxContainer/LVL"
	
func _ready() -> void:
	var levpass = Global.levels_passed +1
	
	for i in range (1,4):
		if levpass > i:
			get_node(str(adres1)+str(i)).text = "LVL" + str(i) + " - DONE"
			get_node(str(adres1)+str(i)).add_color_override("font_color", Color(0.1,0.9,0,1))
		if levpass < i:
			get_node(str(adres1)+str(i)).add_color_override("font_color", Color(1,0.1,0.2,1))
	
	for i in range (4,9):
		if levpass > i:
			get_node(str(adres2)+str(i)).text = "LVL" + str(i) + " - DONE"
			get_node(str(adres2)+str(i)).add_color_override("font_color", Color(0.1,0.9,0,1))
		if levpass < i:
			get_node(str(adres2)+str(i)).add_color_override("font_color", Color(1,0.1,0.2,1))
			
	for i in range (9,12):
		if levpass > i:
			get_node(str(adres3)+str(i)).text = "LVL" + str(i) + " - DONE"
			get_node(str(adres3)+str(i)).add_color_override("font_color", Color(0.1,0.9,0,1))
		if levpass < i:
			get_node(str(adres3)+str(i)).add_color_override("font_color", Color(1,0.1,0.2,1))
	
#for button in get_tree().get_nodes_in_group("my_buttons"):
#    button.connect("pressed", self, "_some_button_pressed", [button])

#func _some_button_pressed(button):
#    print(button.name)
	
	

#func _on_LVL4_pressed() -> void:
#	if Global.levels_passed > 2:
#		Globalscene.get_node("IntroSound3").stop()
#		get_tree().change_scene("res://src/MAPY/Map_4.tscn")


func _on_Quit_pressed() -> void:
	get_tree().change_scene("res://src/menu/Control.tscn")

func _on_LVL_pressed(extra_arg_0: int) -> void:
	print(extra_arg_0)
	if Global.levels_passed > extra_arg_0-2:
		Globalscene.get_node("IntroSound3").stop()
		var zmienna = str("res://src/MAPY/Map_" + str(extra_arg_0)+ ".tscn")
		get_tree().change_scene(zmienna)
