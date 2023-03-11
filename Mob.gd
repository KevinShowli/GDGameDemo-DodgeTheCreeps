extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.playing = true
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	var lens = mob_types.size()
	$AnimatedSprite.animation = mob_types[randi() % lens]



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

