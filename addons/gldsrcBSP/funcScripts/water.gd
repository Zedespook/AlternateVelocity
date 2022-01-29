extends Area

export var stage_index = 0

func _ready():
	self.connect("body_entered",self,"_on_ladder_body_entered")
	self.connect("body_exited",self,"_on_ladder_body_exited")


func _on_ladder_body_entered(body):
	if body.is_in_group("Player"):
		body.global_transform.origin = Vector3(
			body.positions_dict.values()[stage_index][0],
			body.positions_dict.values()[stage_index][1],
			body.positions_dict.values()[stage_index][2]
		)
	
	if body.is_in_group("hlTrigger"):
		if body.has_method("enterWater"):
			body.enterLadder()


func _on_ladder_body_exited(body):
	if body.is_in_group("hlTrigger"):
		if body.has_method("exitWater"):
			body.exitLadder()

