extends RigidBody3D

var speed = 2

#func _physics_process(delta):
	#position += -transform.basis.z * speed * delta

