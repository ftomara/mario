extends Block
class_name MystreyBox

#bonus refs
const COIN_SCENE = preload("res://scenes/coin.tscn")
const MASHROOM_SCENE = preload("res://scenes/mashroom.tscn")
const SHOOTING_FLOWER_SCENE = preload("res://scenes/shooting_flower.tscn")
enum BonusType{
	COIN,
	MASHROOM,
	FLOWER
}
@onready var animated_sprite_2d = $AnimatedSprite2D
@export var bonus_type: BonusType = BonusType.COIN
@export var invisible: bool = false
var is_empty = false

func _ready():
	animated_sprite_2d.visible = !invisible
	
func bump(player_mode : Player.PlayerMode):
	if is_empty:
		return
	if invisible:
		animated_sprite_2d.visible = true
		invisible = !invisible
	super.bump(player_mode)
	make_empty()
	
	match bonus_type:
		BonusType.COIN:
			spawn_coin()
		BonusType.MASHROOM:
			spawn_mashroom()
		BonusType.FLOWER:
			spawn_flower()			

func make_empty():
	is_empty = true
	animated_sprite_2d.play("empty")
	
func spawn_coin():
	var coin = COIN_SCENE.instantiate()
	coin.global_position = global_position+ Vector2(0,-16)
	get_tree().root.add_child(coin)
	get_tree().get_first_node_in_group("level_manger").on_coin_collected()
func spawn_mashroom():
	var mashroom = MASHROOM_SCENE.instantiate()
	mashroom.global_position = global_position
	get_tree().root.add_child(mashroom)
func spawn_flower():
	var flower = SHOOTING_FLOWER_SCENE.instantiate()
	flower.global_position = global_position
	get_tree().root.add_child(flower)
	
