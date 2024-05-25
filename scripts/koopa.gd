extends Enemy
class_name Koopa
var in_a_shell = false
const KOOPA_SHELL_COLLISIONSHAPE_POSITION = Vector2(0,5)
const KOOPA_SHELL_COLLISIONSHAPE = preload("res://Resources/CollisionShapes/koopa_shell_collisionshape.tres")
const KOOPA__FULL_COLLISIONSHAPE = preload("res://Resources/CollisionShapes/koopa__full_collisionshape.tres")
@onready var collision_shape_2d = $CollisionShape2D
@export var slide_speed = 200
func _ready():
	collision_shape_2d = KOOPA__FULL_COLLISIONSHAPE


func die():
	if!in_a_shell:
		super.die()
		
	collision_shape_2d.set_deferred("shape",KOOPA_SHELL_COLLISIONSHAPE)
	collision_shape_2d.set_deferred("position",KOOPA_SHELL_COLLISIONSHAPE_POSITION)
	in_a_shell = true
		
func on_stomp(player_position  :Vector2):
	set_collision_mask_value(1,false)
	set_collision_layer_value(3,false)
	set_collision_layer_value(4,true)
	
	var movement_direction = 1 if player_position.x <= global_position.x else -1
	horizontal_speed = -movement_direction * slide_speed
	

