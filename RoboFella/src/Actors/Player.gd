extends Actor

export var landing_impulse: = 1000.0
export var movement_speed_modifier = 1.0
var on_floor = false
onready var play_animation: AnimationPlayer = get_node("PlayerCam/AnimationPlayer")
var key_count = 0
var allowed_to_move = true

func _on_EnemyCheck_area_entered(_area: Area2D) -> void:
	_velocity = calculate_landing_velocity(_velocity, landing_impulse)

func _on_EnemyCheck_body_entered(_body: Node) -> void:
	allowed_to_move = false
	self.visible = false
	$DeathByEnemy.play()
	$EnemyCheck/CollisionShape2D.queue_free()

func _on_EnemyTouched_body_entered(_body: Node) -> void:
	allowed_to_move = false
	self.visible = false
	$DeathByEnemy.play()
	$EnemyTouched/CollisionShape2D.queue_free()
	
func _on_DeathByEnemy_finished() -> void:
	death()

func _physics_process(_delta: float) -> void:
	if allowed_to_move == false:
		yield().get_direction()
	animation()
	sound()
	var is_jump_stopped: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_stopped)
	_velocity = move_and_slide(_velocity, FLOOR_STANDARD)


func animation() -> void:
	
	if Input.is_action_pressed("move_right"):
		$Cog1.rotation += 0.2
		$Cog2.rotation += 0.2
		$Cog3.rotation += 0.2
		if on_floor == true:
			$AnimatedSprite.play("Standard")
	elif Input.is_action_pressed("move_left"):
		$Cog1.rotation += -0.2
		$Cog2.rotation += -0.2
		$Cog3.rotation += -0.2
		if on_floor == true:
			$AnimatedSprite.play("Standard")
	else:
		if on_floor == true:
			$AnimatedSprite.play("Idle")
	
	if is_on_floor():
		on_floor = true
	else:
		on_floor = false
		if _velocity.y < 0:
			$AnimatedSprite.play("Jump")
		else:
			$AnimatedSprite.play("Standard")
			


	
	
func sound() -> void:
	if Input.is_action_just_pressed("move_right"):
		$rightSound.play()
	elif Input.is_action_just_released("move_right"):
		$rightSound.stop()
	
	if Input.is_action_just_pressed("move_left"):
		$leftSound.play()
	elif Input.is_action_just_released("move_left"):
		$leftSound.stop()
		
	if Input.is_action_just_pressed("jump"):
		$jumpSound.play()
	elif Input.is_action_just_released("jump"):
		$jumpSound.stop()
	


func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		key_count += 1
		if key_count == 1:
			play_animation.play("Zoom")

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
	)

func calculate_move_velocity(linear_velocity: Vector2, direction: Vector2, speed: Vector2, is_jump_stopped: bool) -> Vector2:
	var new_velocity: = linear_velocity
	new_velocity.x = speed.x * direction.x * movement_speed_modifier
	new_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y
	if is_jump_stopped:
		new_velocity.y = 0.0
	return new_velocity

func calculate_landing_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
	var out: = linear_velocity
	out.y = -impulse
	return out

func death() -> void:
	UserData.deaths += 1
	queue_free()
	




