extends KinematicBody2D

# Speed of the Ball, can be changed in Inspector
export var speed = 500

# Rotation of the Ball, can be changed in Inspector
export var rotation_rate = 100
var rotation_speed = deg2rad(rotation_rate)

# A 0, 0 velocity vector
var velocity = Vector2()

# Position, Rotation(in radians) and velocity is set upon instantiation
func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)

# Upon collision, move in direction of the normal
func _physics_process(delta):
	
	# Rotate the Ball
	rotate(rotation_speed * delta)
	
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		$'../CollisionSound'.play()
		velocity = velocity.bounce(collision.normal)
		
		# Increment score when ball collides with the right wall
		if collision.collider.name == 'RightWall':
			Global.score += 1
			$'../HUD'.update_score(Global.score)

# When ball leaves the scree, Game Over
func _on_VisibilityNotifier2D_screen_exited():
	$'../HUD'.show_game_over()
	self.queue_free()
