extends Node

var player_data: Dictionary = {
	"class_data": null,
	"weapons_data": [],
	"skills_data": [],
	"player_name": "",
	"stats": {}
}

static func clone_resource(resource: Resource) -> Resource:
	return resource.duplicate(true) if resource else null
