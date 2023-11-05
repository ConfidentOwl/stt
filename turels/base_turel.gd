extends Node2D

class_name Turet

@onready var my_gun = $gun
@onready var reload_timer = $Reload
@onready var my_gun_sprite = $gun/gun_sprite
enum states {
	IDLE,
	ATACK,
}

var current_state = states.IDLE 

var wathing_list = []

var damage = 50 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body. 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match  current_state :
		states.IDLE:
			if wathing_list.size() >0 :
				current_state = states.ATACK
		states.ATACK:
			if wathing_list.size() == 0 :
				current_state = states.IDLE
				return
			my_gun.look_at(wathing_list[0].global_position)
			self.try_shoot()

func _on_watch_radius_area_entered(area): # enemy enter
	wathing_list.append(area.get_parent())

func _on_watch_radius_area_exited(area):# enemy leave
	wathing_list.erase(area.get_parent())

func try_shoot():
	if reload_timer.is_stopped():
		reload_timer.start(1)
		my_gun_sprite.play()
		wathing_list[0].take_damage(damage)
