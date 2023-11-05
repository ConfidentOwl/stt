extends TileMap

var list_bild_pos = [Vector2i(6,7),Vector2i(3,3)]

var base_turet = preload("res://turels/base_turel.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var clicked_cell = local_to_map(get_local_mouse_position())
			if list_bild_pos.find(clicked_cell)!= -1 :
				list_bild_pos.erase(clicked_cell)
				var spawn_base_turet = base_turet.instantiate()
				self.add_child(spawn_base_turet)
				var tile_center_pos = map_to_local(clicked_cell)
				spawn_base_turet.position = tile_center_pos



