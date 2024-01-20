extends MeshInstance3D

var hay_disparo : bool = false
var rango_arma : float = 1000.0
@export var proyectil : PackedScene
var camara : Camera3D
var viewport : Viewport
var mirilla : Vector2
var impacto : Vector3
var origen : Vector3
var destino : Vector3

func _ready():
	camara = get_viewport().get_camera_3d()
	viewport = get_viewport()
	mirilla = viewport.get_size()/2

func _input(event):
	if event is InputEventKey:
		if Input.is_action_just_pressed("Disparo"):
			hay_disparo = true


func _physics_process(delta):
	if hay_disparo == true:
		origen = camara.project_ray_origin(mirilla)
		destino = origen + camara.project_ray_normal(mirilla) * rango_arma
		var space_state = get_world_3d().direct_space_state
		var query = PhysicsRayQueryParameters3D.create(origen,destino)
		var result = space_state.intersect_ray(query)
		if !result.is_empty():
			impacto = result.position
			dispara_proyectil()
			hay_disparo = false

func dispara_proyectil():
	var nuevo_proyectil = proyectil.instantiate()
	owner.add_child(nuevo_proyectil)
	nuevo_proyectil.get_global_transform().origin = origen	
	var direccion = (impacto - $Bocacha.get_global_transform().origin).normalized()
	nuevo_proyectil.set_linear_velocity(direccion * 5)
	
