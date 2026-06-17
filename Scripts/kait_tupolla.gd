extends StaticBody3D

func _ready() -> void:
	$"../../Debug Character".connect("playerPresent", Callable(self, "_on_debug_character_player_present"))
	
func _on_button_down():
	print("Button down!")
func _on_debug_character_player_present(player: CharacterBody3D) -> void:
	if $Area3D.overlaps_body(player):
		InteractedWith()
	pass # Replace with function body.

func InteractedWith():
	print_tree()
	
	pass
