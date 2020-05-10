extends StaticBody2D
class_name InteractableObject

var interactable = false

func _on_InteractArea_body_entered(player):
	if player is Player:
		interactable = true
		GameManager.Player.connect("interact_with_object", self, "_on_interacted_with_object")

func _on_InteractArea_body_exited(player):
	if player is Player:
		interactable = false
		GameManager.Player.disconnect("interact_with_object", self, "_on_interacted_with_object")

func interaction():
	print("Player interacted with ", self)

func _on_interacted_with_object():
	if interactable == true:
		interaction()
