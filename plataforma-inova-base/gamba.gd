extends CharacterBody2D
@onready var direita: RayCast2D = $Direita
@onready var esquerda: RayCast2D = $Esquerda
@onready var baixo_direita: RayCast2D = $"Baixo Direita"
@onready var baixo_esquerda: RayCast2D = $"Baixo Esquerda"
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 25.0
const JUMP_VELOCITY = -400.0
var direction = -1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	velocity.x = SPEED * direction

	move_and_slide()
	
	if direita.is_colliding() or baixo_direita.is_colliding() == false:
		direction = -1
	if esquerda.is_colliding() or baixo_esquerda.is_colliding() == false:
		direction = 1
		
	if direction > 0:
		sprite.flip_h = true
	elif direction < 0:
		sprite.flip_h = false
