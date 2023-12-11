extends Node

const CONFIG_PATH = "user://data.cfg"
const _PASSWORD = "oh_great_you_found_the_password_congratulatins_84739204103xx"
enum Section { SETTING }
var _config: ConfigFile

func _ready():
	_config = ConfigFile.new()
	var err = _config.load(CONFIG_PATH)
#	var err = _config.load_encrypted_pass(CONFIG_PATH, _PASSWORD)
	if err != OK:
		print("Config does not exist, default is used :: %s" % err)
		save()

func save():
	_config.save(CONFIG_PATH)
#	_config.save_encrypted_pass(CONFIG_PATH, _PASSWORD)

func clear():
	_config.clear()
	
func get_value(p_section: Section, p_setting: String, p_default: Variant) -> Variant:
	if _config == null:
		return p_default
	return _config.get_value(Section.keys()[p_section], p_setting, p_default)

func set_value(p_section: Section, p_setting: String, p_value: Variant) -> void:
	_config.set_value(Section.keys()[p_section], p_setting, p_value)
	save()

func log_console():
	for section in _config.get_sections():
		print("======== %s ========" % section)
		for key in _config.get_section_keys(section):
			print("%s: %s" % [key, _config.get_value(section, key)]) 
	
