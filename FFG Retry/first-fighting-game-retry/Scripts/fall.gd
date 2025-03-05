class_name PlayerFallState
extends PlayerState

const AIR_SPEED: float = 75
const JUMP_FORCE: float = -75

func enter() -> void:
	super()
	player.animation.play(fall_anim, -1, 2)

func exit(new_state: State = null) -> void:
	super(new_state)
	player.velocity.x = 0.0

func process_input(event: InputEvent) -> State:
	super(event)
	if event.is_action_pressed(movement_key): determine_sprite_flipped(event.as_text())
	return null

func process_physics(delta: float) -> State:
	do_move(get_move_dir())
	player.velocity.y += gravity * delta
	if(player.is_on_floor()):
		if get_move_dir() != 0: 
			return walk_state
		else: return idle_state
	return null

func get_move_dir() -> float:
	return Input.get_axis(left_key, right_key)

func do_move(move_dir: float) -> void:
	player.velocity.x = move_dir * AIR_SPEED
