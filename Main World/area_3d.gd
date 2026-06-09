extends Area3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_test_player_player_present(player: CharacterBody3D) -> void:
	#loading zone DO ONE SINGLE TIME OTHERWISE IT WILL KEEP INSTANTIATING SCENES
	var temp = load("res://Main World/racetracks.tscn")
	var tempChild = temp.instantiate()
	self.get_parent().add_child(tempChild)
	
	
	
	print("yuh")
	
	pass
