extends StaticBody2D

class_name PipeConnector

@export var return_point : Vector2
func _on_enterance_body_entered(body):
	SceneData.return_point = return_point
	(body as Player).handle_pipe_connector_enterance_collision()
