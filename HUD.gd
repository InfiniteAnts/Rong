extends CanvasLayer

signal start_game

# Update score
func update_score(score):
	$ScoreLabel.text = str(score)
	
	# Store if best score
	if score > Global.best_score:
		Global.set_best_score(score)

# When Start Button is pressed,
func _on_StartButton_pressed():
	
	# Hide Start Menu
	$StartButton.hide()
	$MessageLabel.hide()
	$'ScoreContainer/LastScoreLabel'.hide()
	$'ScoreContainer/BestScoreLabel'.hide()
	
	# Show the score
	Global.score = 0
	update_score(Global.score)
	$ScoreLabel.show()
	
	# Start the game
	Global.game_started = true
	emit_signal('start_game')

# When game is over,
func show_game_over():
	
	# Play the GameOverSound
	$'../GameOverSound'.play()
	
	# Stop the game
	Global.game_started = false

	# Hide the score and the paddle
	$ScoreLabel.hide()
	if Global.paddle_exit == false:
		$'../Paddle'.hide()
	
	# Show Game Over screen
	$StartButton.text = 'Game Over'
	$MessageLabel.text = 'Tap To Retry'
	$'ScoreContainer/LastScoreLabel'.text = 'Last: ' + str(Global.score)
	$'ScoreContainer/BestScoreLabel'.text = 'Best: ' + str(Global.best_score)
	
	$StartButton.show()
	$MessageLabel.show()
	$'ScoreContainer/LastScoreLabel'.show()
	$'ScoreContainer/BestScoreLabel'.show()