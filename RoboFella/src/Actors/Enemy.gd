extends "res://src/Actors/Actor.gd"
export var kill: = 5
var time = null

#Variable made for testing
var made_contact_with_colision_num = 0

func _ready() -> void:
	$EnemyMove.play()
	time = Timer.new()
	time.set_wait_time(0.5)
	time.set_one_shot(true)
	time.connect("timeout", self, "death")
	add_child(time)
	set_physics_process(false)
	_velocity.x = -speed.x
	if $EnemyWheel.is_inside_tree():
		if _velocity.x > 0:
			$EnemyWheel.rotation += 0.2
		else:
			$EnemyWheel.rotation += -0.2

		
	
func _physics_process(delta: float) -> void:	
	_velocity.y += gravity * delta
	_velocity.y = move_and_slide(_velocity, FLOOR_STANDARD).y
	if is_on_wall() == true:
		_velocity.x = _velocity.x * -1.0
		self.scale.x *= -1


func _on_playerLanding_body_entered(body: Node) -> void:
	if body.visible == true:
		if made_contact_with_colision_num == 1:
			UserData.score += kill
			$EnemyKill.play()
			death()
		made_contact_with_colision_num += 1
		if body.global_position.y > get_node("playerLanding").global_position.y:
			return
		get_node("CollisionShape2D").set_deferred("disabled", true)



func death() -> void:
		$EnemyWheel.visible = false
		$EnemyMove.stop()
		$AnimatedSprite.play("Death")

		time.start()
		
		yield(time, "timeout")
		queue_free()






