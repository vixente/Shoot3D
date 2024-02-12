extends MeshInstance3D

var hay_disparo : bool = false
var rango_arma : float = 1000.0
@export var proyectil : PackedScene
@export var camara : Camera3D
var viewport : Viewport
var mirilla : Vector2
var impacto : Vector3
var origen : Vector3
var destino : Vector3

func _ready():
	#camara = get_viewport().get_camera_3d()
	viewport = get_viewport()
	mirilla = viewport.get_size()/2


func _physics_process(delta):
	if Input.is_action_just_pressed("Disparo"):
		dispara_proyectil()


func dispara_proyectil():
	var nuevo_proyectil = proyectil.instantiate()
	nuevo_proyectil.camara = camara
	get_tree().get_root().add_child(nuevo_proyectil)
	#nuevo_proyectil.reparent(get_tree().get_root(),true)
	#$Bocacha.add_child(nuevo_proyectil)
	nuevo_proyectil.global_position = $Bocacha.global_position
	nuevo_proyectil.global_basis = $Bocacha.global_basis

	
	#

	
func dibuja_proyectil():
	if origen && impacto:
		var malla = MeshInstance3D.new()
		var linea = ImmediateMesh.new()
		linea.surface_begin(Mesh.PRIMITIVE_LINES)
		linea.surface_set_color(Color.AQUA)
		linea.surface_add_vertex($Bocacha.get_global_transform().origin)
		linea.surface_add_vertex(impacto)
		linea.surface_end()
		malla.mesh = linea
		owner.add_child(malla)
		print($Bocacha.get_global_transform().origin, impacto)





