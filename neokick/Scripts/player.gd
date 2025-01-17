class_name Player
extends CharacterBody2D


@onready var state_machine: StateMachine = $"State Machine"

func _ready(): state_machine.init()

func _process(delta): state_machine.process_frame(delta)

func _physics_process(delta): state_machine.process_physics(delta)

func _input(event): state_machine.process_input(event)