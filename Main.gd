extends Node


export(PackedScene) var mob_scene

var score


func _ready():
	randomize()
	#new_game()
	


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Music.play()


func _on_MobTimer_timeout():
	var mob = mob_scene.instance()
	
	var mob_spawn_location = get_node("MobPath2D/MobSpawnLocation")
	# 返回介于 0 到 2^32 - 1 之间的随机整数 沿着路径的距离，单位为像素。
	mob_spawn_location.offset = randi()
	
	# 方向调整为正y方向（下） pi = 180°/2  90° 顺时针为正
	var direction = mob_spawn_location.rotation + PI / 2
	mob.position = mob_spawn_location.position
	
	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	# 直线距离
	var velocity = Vector2(rand_range(150.0,300.0), 0.0)
	# 线性速度向量，有方向 单位为像素每秒。
	mob.linear_velocity = velocity.rotated(direction)
	
	add_child(mob)


func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	
	
	
	
	
	
	
	
	
	
	
	
	
	
