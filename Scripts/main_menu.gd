extends Control

var CURRENT_SCENE
signal START_FRESH()
signal CONTINUE()

#Start Button
func _on_texture_button_pressed() -> void:
	START_FRESH.emit()



#Options Button
func _on_texture_button_2_pressed() -> void:
	
	pass # Replace with function body.


#Continue Button
func _on_texture_button_3_pressed() -> void:
	CONTINUE.emit()

#Quit Button
func _on_texture_button_4_pressed() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	
