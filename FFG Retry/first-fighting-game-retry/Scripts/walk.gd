class_name PlayerWalkState
extends PlayerState

const SPEED: float = 75

func enter() -> void:
	super()
	player.animation.play(walk_anim, -1, 2)

func exit(new_state: State = null) -> void:
	super(new_state)
	player.velocity.x = 0.0

func process_input(event: InputEvent) -> State:
	super(event)
	if event.is_action_pressed(left_key): determine_sprite_flipped(event.as_text())
	elif event.is_action_pressed(jump_key): return jump_state
	elif event.is_action_pressed(punch_key): return punch_state
	elif event.is_action_pressed(kick_key): return kick_state
	return null

func process_physics(delta: float) -> State:
	super(delta)
	do_move(get_move_dir())
	
#Pasted from past project
# Flipping character sprite when player moves to the left 
	if player.velocity.x < 0:
		$"../../Sprite".flip_h = sprite_flipped
	
	# Return character sprite to normal when player moves to the right
	if player.velocity.x > 0:
		$"../../Sprite".flip_h = false
	
	## Make character sprite play run animation when the player moves, ilde if player stays still
	if player.velocity.x != 0:
		$"../../Sprite".play("Walk")
	if player.velocity.x == 0:
		$"../../Sprite".play("Idle")
#End of paste
	return null

func get_move_dir() -> float:
	return Input.get_axis(left_key, right_key)

func do_move(move_dir: float) -> void:
	player.velocity.x = move_dir * SPEED
