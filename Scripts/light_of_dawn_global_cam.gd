extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../Debug Character"._disable_LocalCam()
	self.current = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position = Vector3($"../Debug Character".position.x,self.position.y, self.position.z)
	
