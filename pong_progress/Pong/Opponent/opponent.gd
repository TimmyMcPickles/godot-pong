extends CharacterBody2D

var speed = 5
var ball # helps opponent find ball on screen

func _ready():
	ball = get_parent().find_child("Ball") #finds the parent node, and then finds child node "Ball"

func _physics_process(delta):
	move_and_collide(Vector2(0, get_opponent_direction()) * speed) # Passes the vector to the opponent
	# this pulls the get_opponent_direction function, and applies it to the vector
	# makes the opponent move up and down dependent on ball position

func get_opponent_direction(): # Does not have _ before var name because it needs to be called individually to work
	if abs(ball.position.y -  position.y) > 25: # finds the absolute value for both positions. looking for distance betwen the two
		if ball.position.y > position.y: return 1 #determines if ball is below the opponent
		else: return -1 #determines if ball is above the opponent
	else: return 0
	# return determines what value we get dependent on what happens
	# if the ball is below the opponentt we get 1, above is -1, and neither is 0
	# kinda confused but I think that just makes the opponent decide what its supposed to do
