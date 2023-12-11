class_name MenuBarContainer
extends VBoxContainer

@onready var volume_slider := $MarginContainer/VolumeSlider

func _ready():
	volume_slider.value_changed.connect(_on_volume_slider_changed)
	volume_slider.value = Storage.get_value(Storage.Section.SETTING, "volume", 0)

func _on_volume_slider_changed(p_value: float) -> void:
	Storage.set_value(Storage.Section.SETTING, "volume", p_value)
	Audio.set_volume(p_value)
