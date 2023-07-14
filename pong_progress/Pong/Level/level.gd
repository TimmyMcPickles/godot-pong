extends Node

var PlayerScore = 0
var OpponentScore = 0

func _on_left_body_entered(body):
	$Ball.position = Vector2(640, 360) # $ lets us manipulate a certain node that the parent controls
	OpponentScore += 1 # Adds 1 to the opponents score when ball goes to the left
	get_tree().call_group('BallGroup', 'stop_ball') # get_tree gives the code access to the entire root node while game runs which gives access to functions like calling a group
	$CountdownTimer.start() # calls the countdown timer node and starts it after ball leaves screen
	$CountdownLabel.visible = true
	$ScoreSound.play()

func _on_right_body_entered(body):
	$Ball.position = Vector2(640, 360) 
	PlayerScore += 1 # Adds 1 to player score when ball goes right
	get_tree().call_group('BallGroup', 'stop_ball')
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()

func _process(delta): #this func updates the Player/opponent scores to strings so they can be displayed
	$PlayerScore.text = str(PlayerScore) 
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left) + 1) # Takes the countdowntimer and turns it to a string to be displayed as a label

func _on_countdown_timer_timeout():
	get_tree().call_group('BallGroup', 'restart_ball') # restarts the balls movement after a timer
	$CountdownLabel.visible = false
