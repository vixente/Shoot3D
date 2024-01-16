extends RigidBody3D
class_name Bala


#@export var Direccion : Vector3
@export var velocidad : float = 100
@export var camara : Camera3D
var posicion_original : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	posicion_original = global_transform.origin
	pass # Replace with function body.
	
func _physics_process(delta):
	var calculo = -transform.basis.z * velocidad * delta
	global_transform.origin.z += calculo.z
	
	var distancia : float = posicion_original.distance_to(global_transform.origin)
	print("Distancia: ",distancia)
	if distancia > 100:
		queue_free()
