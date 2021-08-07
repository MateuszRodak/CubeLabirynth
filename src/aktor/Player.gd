extends KinematicBody2D

export var premiumskin: Texture
export var speed: = Vector2(300,300)
var velocity: = Vector2.ZERO

func _ready() -> void:
	#if Global.music == true :
	$playersound.play(0.8)
	$player2/actuallvl.text = "LVL" + str(Global.levels_passed+1)
	$"Baner in game".load_banner()
	if Global.premium_skin == 1:
		$player2.texture = premiumskin
	

func _physics_process(delta: float) -> void:
	
	velocity = move_and_slide(velocity)
	var direction: = Vector2(
	Input.get_action_strength("move right") - Input.get_action_strength("move left"), 
	Input.get_action_strength("move down") - Input.get_action_strength("move up")
	)
	
	velocity = speed * direction * delta *50

func _on_body_entered(body: Node) -> void:
	$"Baner in game".show_banner()
	pass # Replace with function body.

func _on_quittomenu_pressed() -> void:
	$"Baner in game".hide_banner()
	if Global.music == true:
		Globalscene.get_node("IntroSound3").play(0.6)
	get_tree().change_scene("res://src/menu/Control.tscn")

func _on_menuquit_pressed() -> void:
	$"Baner in game".hide_banner()
	if Global.music == true:
		Globalscene.get_node("IntroSound3").play(0.6)
	get_tree().change_scene("res://src/menu/Control.tscn")


func _on_Player_tree_exiting() -> void:
	$"Baner in game".hide_banner()
