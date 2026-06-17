extends StaticBody3D

func _ready() -> void:
	$Sprite3D.frame = randi_range(0,$Sprite3D.hframes + $Sprite3D.vframes)
