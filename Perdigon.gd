extends RigidBody3D

var speed = 100
var direccion : Vector3 = Vector3.FORWARD
var camara : Camera3D

func _ready():
	
	if camara != null:
		direccion = camara.global_transform.basis.z
		apply_central_impulse(-direccion * speed)
	else:
		push_error("Sin camara :(")

func _physics_process(delta):
	if position.distance_to(camara.position) > 100:
		queue_free()
		
