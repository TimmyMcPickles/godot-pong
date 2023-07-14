extends CharacterBody2D

@export var speed = 10   #defining speed

func _physics_process(delta):    #Uses a physics process for the function
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	move_and_collide(velocity * speed)  #determines how fast the paddle moves with velocity and speed
