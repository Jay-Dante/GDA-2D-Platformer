extends KinematicBody2D

var velocity = Vector2();

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	velocity.y += 20;
	
	move_and_slide(velocity);
