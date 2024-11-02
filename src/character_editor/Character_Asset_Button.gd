@tool
extends Button

@export var asset_id: String
#@export var asset_slot: String # (String, "skin", "hair", "torso", "legs", "feet", "arms")
@export var asset_slot: Array = ["skin", "hair", "torso", "legs", "feet", "arms"]
@export var unlocked: bool = false: set = _set_unlocked
@export var display_name: String
@export var image: Texture2D

signal character_asset_clicked

func _ready():
	$TextureRect.texture = image

func _set_unlocked(value):
	unlocked = value
	$Unlocked_Image.visible = !unlocked
	if unlocked:
		get("theme_override_styles/normal").set("bg_color", "dadada")
	else:
		get("theme_override_styles/normal").set("bg_color", "2b2b2b")
	return unlocked


func _on_Button_pressed():
	if unlocked:
		emit_signal("character_asset_clicked", asset_id)
