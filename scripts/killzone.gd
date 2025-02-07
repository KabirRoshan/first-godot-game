extends Area2D

# Accessing timer node so I can use in this script.
@onready var timer: Timer = $Timer

# Triggered when player enters the killzone
func _on_body_entered(body: Node2D) -> void:
	print("You died!")
	# Slows down entire game on death
	Engine.time_scale = 0.5
	# Makes player fall through map on death
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

# When timer runs out it will execute this function to reload scene
func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
