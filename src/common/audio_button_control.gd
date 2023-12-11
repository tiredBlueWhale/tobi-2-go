class_name AudioButton
extends Button

var _is_playing = false
@export var sound: Sound

func _ready():
	toggled.connect(_on_toggled)
	Audio.audio_player.finished.connect(_on_audio_finished)
	update()

func update():
	if sound == null:
		return
	text = sound.title
	modulate = sound.color

func _on_toggled(p_button_pressed):
	if sound == null:
		return
	elif not _is_playing and p_button_pressed:
		Audio.play(sound.file)
		_is_playing = true
	elif not p_button_pressed:
		_is_playing = false

func _on_audio_finished():
	button_pressed = false
