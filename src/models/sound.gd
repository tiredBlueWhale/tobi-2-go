@tool
class_name Sound
extends Resource

@export var title: String
@export var file: AudioStreamMP3
@export var color: Color

func _init(
		p_title: String,
		p_file = preload("res://assets/audio/tobi/nice_tobi.mp3"),
		p_color = Color.SKY_BLUE
	):
	title = p_title
	file = p_file
	color = p_color
