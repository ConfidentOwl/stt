extends PathFollow2D

var speed = 200
var hp = 100 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.progress=self.progress+(speed*delta)
	if self.progress_ratio >= 1:
		self.destroy()

func destroy():
	self.queue_free()

func take_damage(amount):
	hp=hp- amount
	if hp <=0:
		self.destroy() 
		
func get_base():
	Global.get_hp_damage()
	self.destroy()
