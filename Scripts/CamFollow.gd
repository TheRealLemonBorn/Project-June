extends Marker3D

var playerObject

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerObject = $"../Test player"
	set_position(playerObject.position)# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	set_position(Vector3(playerObject.position.x, self.position.y, self.position.z))
	pass
