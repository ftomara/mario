extends Area2D

class_name ShootingFlower
# Called when the node enters the scene tree for the first time.
func _ready():
	var spawn_tween = get_tree().create_tween()
	spawn_tween.tween_property(self,"position" , position+Vector2(0,-16), .4)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
