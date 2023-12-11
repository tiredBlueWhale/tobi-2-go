class_name SpeakerScrollContainer
extends Control

@export var sounds: Array[Sound] = [
	Sound.new("Nice", preload("res://assets/audio/tobi/nice_tobi.mp3"), Color("#ffb000")),
	Sound.new("Amazing", preload("res://assets/audio/tobi/amazing_tobi.mp3"), Color("#ffb000")),
	Sound.new("Good", preload("res://assets/audio/tobi/good_tobi.mp3"), Color("#ffb000")),
	Sound.new("Magnificent", preload("res://assets/audio/tobi/magnificent_tobi.mp3"), Color("#ffb000")),
	Sound.new("Good Job", preload("res://assets/audio/tobi/good_job_tobi.mp3"), Color("#ffb000")),
	Sound.new("Excellent", preload("res://assets/audio/tobi/excellent_tobi.mp3"), Color("#ffb000")),
]

@onready var spacer_top := $ScrollContainer/VBoxContainer/SpacerTop
@onready var spacer_bottom := $ScrollContainer/VBoxContainer/SpacerBottom
@onready var content := $ScrollContainer/VBoxContainer/Content
@onready var label := $Label
@onready var audio_button = preload("res://common/audio_button.tscn")
@onready var audio_button_group = preload("res://assets/button_groups/audio.tres")

func _ready():
	resized.connect(_on_resized)
	_on_resized()
	_update()

func _on_resized():
	label.size.x = size.x
	label.position = Vector2(0, UI.safe_area_top)
	spacer_top.custom_minimum_size.y = label.position.y + label.size.y
	# TODO: 128 == height of menu_bar
	spacer_bottom.custom_minimum_size.y = UI.safe_area_bottom + 128

func _update():
	for child in content.get_children():
		child.queue_free()
	
	for sound in sounds:
		var button = audio_button.instantiate() as AudioButton
		button.sound = sound
		button.button_group = audio_button_group
		content.add_child(button)
