class_name MainControl
extends Control

@onready var menu_bar := $MenuBarContainer

func _ready():
	resized.connect(_on_resized)
	_on_resized()

func _on_resized():
	menu_bar.size.x = size.x
	menu_bar.position = Vector2(0, size.y - UI.safe_area_bottom - menu_bar.size.y)

func _unhandled_key_input(event):
	if event is InputEventKey:
		if event.is_pressed() and event.keycode == KEY_P:
			var capture = get_viewport().get_texture().get_image()
			var _time = Time.get_datetime_string_from_system()
			var filename = "user://Screenshot-{0}.png".format({"0":_time})
			capture.save_png(filename)
