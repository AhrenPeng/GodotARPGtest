extends CharacterBody2D

@export var speed = 30
@export var limit = 0.5
@export var endPoint : Marker2D 
var startPosition
var endPosition
@onready var animations = $AnimationPlayer

func _ready():
	startPosition = position
	endPosition = endPoint.global_position
	
func changeDirection():
	var temptEnd = endPosition
	endPosition = startPosition
	startPosition = temptEnd 
	
	
func updateVelocity():
	var moveDirection = endPosition - position
	velocity = moveDirection.normalized() * speed
	if moveDirection.length() < limit :
		changeDirection()


func updateAnimation():
	if velocity.length() ==0: #当向量长度为00时，停止动画
		if animations.is_playing():
			animations.stop()
	else:
		var direction = "Down"
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Up"
	
		animations.play("walk" + direction)

func _physics_process(delta):
	updateVelocity()
	move_and_slide()
	updateAnimation()
