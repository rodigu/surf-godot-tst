class_name FollowPoint
extends Node


export var velocity = 10
export var tolerance_distance = 5
export var max_distance = 50


func follow(follower: Vector2, point: Vector2, delta: float) -> Vector2:
	var distance = follower.distance_squared_to(point)
	if distance <= tolerance_distance ^ 2:
		return follower
	return follower + delta * (velocity + distance / max_distance) * (point - follower).normalized()
