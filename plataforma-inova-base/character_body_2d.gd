extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 180.0
const JUMP_VELOCITY = -300.0
var direction


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Pular") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("Esquerda", "Direita")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	atualizar_animacao()
	
func atualizar_animacao():
		if velocity.x != 0:
			sprite.animation = "andando"
		elif velocity.x == 0:
			sprite.animation = "idle"
			
		if velocity.y < 0:
			sprite.animation = "pulando"
		elif velocity.y > 0:
			sprite.animation = "caindo"
			
		if direction > 0:
			sprite.flip_h = false
		elif direction < 0:
			sprite.flip_h = true
		
