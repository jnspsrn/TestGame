extends StaticBody2D
class_name InteractableObject

export(bool) var interactable = true
onready var interactArea = $InteractArea

func _on_InteractArea_body_entered(player):
	if player is Player:
		player.connect("interacted_with_object", self, "_on_interacted_with_object")

func _on_InteractArea_body_exited(player):
	if player is Player:
		player.disconnect("interacted_with_object", self, "_on_interacted_with_object")

func interaction():
	print("Player interacted with ", self)

func _on_interacted_with_object():
	if interactable == true:
		interaction()
