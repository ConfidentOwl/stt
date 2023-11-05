extends Path2D

var enemy_base = preload("res://enemys/enemy.tscn")
var waves_amounts_spawn = [2,4,6,8,10]
var curent_wave = 0 
var change_waves = false

@onready var wave_timer = $"../Wave_timer"
@onready var spawn_timer = $"../Spawn_timer"

# Called when the node enters the scene tree for the first time.
func _ready():
	#self.add_child(enemy_base.instantiate())
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout(): #Spawn timer
	if change_waves:
		return  
	if waves_amounts_spawn[curent_wave] > 0 :
		waves_amounts_spawn[curent_wave] = waves_amounts_spawn[curent_wave]-1
		self.add_child(enemy_base.instantiate())
		return
	else :
		wave_timer.start(5)
		change_waves = true 


func _on_wave_timer_timeout():
	change_waves = false
	curent_wave = curent_wave +1
