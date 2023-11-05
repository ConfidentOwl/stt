extends Node
#All global vars 

var score : int  = 0
var golds :int = 0 
var hp :int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_hp_damage():
	hp = hp -1
	get_tree().change_scene_to_file("res://game_over.tscn")
