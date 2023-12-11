extends Node

var master_idx: int
@onready var audio_player := $AudioStreamPlayer

func _ready():
	master_idx = AudioServer.get_bus_index("Master")

func set_volume(p_volume: float, idx = master_idx):
	AudioServer.set_bus_volume_db(idx, p_volume)

func play(p_audio_stream: AudioStreamMP3):
	audio_player.stream = p_audio_stream
	audio_player.play()
