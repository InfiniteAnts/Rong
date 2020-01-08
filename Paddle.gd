extends StaticBody2D

# Move Speed of the paddle
export var speed = 100

var velocity = Vector2()

func _physics_process(delta):
	
	velocity.y = speed * delta
	translate(velocity)

func _on_VisibilityNotifier2D_screen_exited():
	Global.paddle_exit = true
	queue_free()
