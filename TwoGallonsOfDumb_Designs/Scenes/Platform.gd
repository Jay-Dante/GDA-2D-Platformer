extends KinematicBody2D

export var speed := 300;
export var gravity := 2000;
export var jump := 700;
export var direction := -1;

var velocity := Vector2.ZERO;
var motion = Vector2();

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	velocity.x = 30;
	
	velocity = move_and_slide(velocity, Vector2.UP);
