extends KinematicBody2D

export var speed := 50;
export var gravity := 1000;
export var direction := -1;
export var detect_cliff := true;

var velocity = Vector2();

# Called when the node enters the scene tree for the first time.
func _ready():
	$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction;
	
func _physics_process(delta):
	
	if is_on_wall() or not $RayCast2D.is_colliding() and detect_cliff and is_on_floor():
		direction = direction * -1;
		$RayCast2D.position.x = $CollisionShape2D.shape.get_extents().x * direction;
	
	velocity.y += gravity * delta;
	
	velocity.x = speed * direction;
	
	velocity = move_and_slide(velocity, Vector2.UP);


func _on_Area2D_body_entered(body):
	
	$AnimatedSprite.play("Death");
	speed = 0;
	
	velocity.y -= 200;
	
	set_collision_layer_bit(4, false);
	set_collision_mask_bit(0, false);
	
	
#	$Area.set_collision_layer_bit(0, false);
#	$Area.set_collision_mask_bit(0, false);
	

func _on_KillYouZone_body_entered(body):
	pass
	#get_tree().change_scene("res://Scenes/Main.tscn");
