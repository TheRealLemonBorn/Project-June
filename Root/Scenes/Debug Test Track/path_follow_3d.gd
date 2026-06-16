extends PathFollow3D

var carSpeed = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	carSpeed = $"Movement Plane/DebugTestVehicle".get_speed()
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var deltaSpeed = delta * carSpeed
	self.set_progress(self.get_progress() + deltaSpeed * carSpeed)
	pass
