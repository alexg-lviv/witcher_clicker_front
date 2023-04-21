extends TextureButton

@export var _name: String
@onready var _item: Item = get_node("Item")
@onready var _description: Label = get_node("Description")

func _ready():
	_item.item_name = _name
	_hide_description()
	_set_description()

func _set_description():
	_description.text = _name.capitalize().replace("_", " ") + "\nPower: " + str(Items.data[_name]["power"])

func _hide_description():
	_description.visible = false

func _show_description():
	_description.visible = true

func _on_pressed():
	Events.emit_signal("update_qty", _name, 1)

func _on_mouse_entered():
	_show_description()

func _on_mouse_exited():
	_hide_description()
