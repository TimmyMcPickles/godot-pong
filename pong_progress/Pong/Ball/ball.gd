extends CharacterBody2D

@export var speed = 600

func _ready():
	randomize()  #Randomizes which the ball at ready
	velocity.x = [-1, 1][randi() % 2]  # random integer between -1 and 1 is chosen to determine direction x
	velocity.y = [-0.8, 0.8][randi() % 2] #same but for y direction
#   ^ All of this together makes the ball move in a random direction at ready

func _physics_process(delta):  #This function makes the ball actually move through a physics process
	var collision_object = move_and_collide(velocity * speed * delta) #Creating the collision object var using move and collide
	if collision_object:
		velocity = velocity.bounce(collision_object.get_normal()) # normal is the direction a specific surface is facing
		$CollisionSound.play()
# get_normal() determines what direction the wall faces, and makes the ball bounce in the correct direction
# Slighlty similar top player.gd, but without player input

func stop_ball():
	speed = 0

func restart_ball():
	speed = 600
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-0.8, 0.8][randi() % 2]
