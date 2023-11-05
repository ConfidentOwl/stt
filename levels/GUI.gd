extends Control

@onready var enemy_spawn_logick = $"../Enemy_path"

@onready var score_label = $HBoxContainer/Label
@onready var waves_label = $HBoxContainer/Label2
@onready var hp_score = $HBoxContainer/Label3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	waves_label.text = str("Wave-",enemy_spawn_logick.curent_wave)
	hp_score.text = str("HP-",Global.hp)
