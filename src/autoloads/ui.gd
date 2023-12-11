extends Node

signal safe_area_changed

var safe_area_top = 0
var safe_area_right = 0
var safe_area_bottom = 0
var safe_area_left = 0

func _ready():
	_update_safe_area()

func _update_safe_area():
	var save_area = DisplayServer.get_display_safe_area()
	var screen_size = DisplayServer.screen_get_size()
	
	var os = DisplayServer.get_name()
	if ["Android", "iOS"].has(os):
		safe_area_top = save_area.position.y
		safe_area_right = max(safe_area_right, screen_size.x - save_area.end.x)
		safe_area_bottom = screen_size.y - save_area.end.y
		safe_area_left = max(safe_area_left, save_area.position.x)

	safe_area_changed.emit()
