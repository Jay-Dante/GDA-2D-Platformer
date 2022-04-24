extends KinematicBody2D

var speed := 300;
var gravity := 2000;
var jump := 700;

var velocity := Vector2.ZERO;
var motion = Vector2();

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	velocity.x = 0;
	
	velocity.y += gravity * delta;
	
	if Input.is_action_pressed("left"):
		velocity.x += -speed;
		$Sprite.flip_h = true; # set sprite to face direction of movement
		$AnimationPlayer.play("Run"); # plays running animation
		
	elif Input.is_action_pressed("right"):
		velocity.x += speed;
		$Sprite.flip_h = false; # set sprite to face direction of movement
		$AnimationPlayer.play("Run"); # plays running animation
	
	else:
		$AnimationPlayer.play("Idle"); # plays idle animation
	
	if Input.is_action_pressed("jump"):
		if is_on_floor():
			velocity.y += -jump; # applies jump force in relation to y axis
		elif !is_on_floor():
			$AnimationPlayer.play("Jump"); # plays jump animation
		
	velocity = move_and_slide(velocity, Vector2.UP);

