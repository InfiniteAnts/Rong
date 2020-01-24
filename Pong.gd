extends Node2D

# Preload the paddle and ball scenes
const PADDLE = preload('res://Paddle.tscn')
const BALL = preload('res://Ball.tscn')

var rng = RandomNumberGenerator.new()

func _ready():
	# Randomize the seed
	rng.randomize()

func _physics_process(delta):
	
	# On tap, instantiate paddle and move it down
	if Input.is_action_just_pressed("ui_accept") and Global.paddle_exit and Global.game_started:
		var paddle = PADDLE.instance()
		self.add_child(paddle)
		paddle.position = $PaddlePosition.global_position
		Global.paddle_exit = false

# Instantiate ball and it's attributes
func new_game():
	var dir = deg2rad(rng.randf_range(120, 240))
	var ball = BALL.instance()
	ball.start($BallPosition.global_position, dir)
	self.add_child(ball)
