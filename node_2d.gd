extends Node2D

var speed = 300
var direction = Vector2(1,0)
var screen_size = Vector2()
var window_size = Vector2()

@onready var salmon = $Salmon

func _ready() -> void:
	screen_size = Vector2(DisplayServer.screen_get_size(0))
	window_size = Vector2(DisplayServer.window_get_size())
	
	var salmony = randi_range(750, 900)
	get_window().position = Vector2i(0, salmony)

func _physics_process(delta: float) -> void:
	var window_position = Vector2(DisplayServer.window_get_position())
	window_position += direction * speed * delta
	
	window_position.x = clamp(window_position.x, 0, screen_size.x - window_size.x)
	window_position.y = clamp(window_position.y, 0, screen_size.y - window_size.y)
	DisplayServer.window_set_position(Vector2i(window_position))

	if window_position.x <= 0 or window_position.x >= screen_size.x - window_size.x:
		direction.x *= -1
	
	if direction.x > 0:
		salmon.flip_h = true
	elif direction.x < 0:
		salmon.flip_h = false

func _process(delta: float) -> void:
	pass
