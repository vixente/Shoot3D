extends Node3D

@export var recoil : int = 5
@export var munifa : int = 15
@export var array_posiciones : PackedVector3Array
@export var camara : Camera3D
var proyectil = preload("res://Escenas/bala.tscn")

var Lista_Modelos_Armas = []

func _ready():
	Lista_Modelos_Armas.append( preload("res://Modelos/Armas/Pistol_Compact_West.obj" ) )
	Lista_Modelos_Armas.append( preload("res://Modelos/Armas/Pistol_Full_West.obj" ) )
	Lista_Modelos_Armas.append( preload("res://Modelos/Armas/Rifle_Assault_West.obj" ) )
	Lista_Modelos_Armas.append( preload("res://Modelos/Armas/Rifle_Battle_West.obj" ) )
	Lista_Modelos_Armas.append( preload("res://Modelos/Armas/Shotgun_Auto_West.obj" ) )
	Lista_Modelos_Armas.append( preload("res://Modelos/Armas/Shotgun_Pump_West.obj" ) )
	Lista_Modelos_Armas.append( preload("res://Modelos/Armas/SMG_Compact_West.obj" ) )
	Lista_Modelos_Armas.append( preload("res://Modelos/Armas/SMG_Full_West.obj" ) )
	Lista_Modelos_Armas.append( preload("res://Modelos/Armas/Sniper_Material_West.obj" ) )
	Lista_Modelos_Armas.append( preload("res://Modelos/Armas/Sniper_Rifle_West.obj" ) )
	pass

func _input(event):
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed("Disparo"):
			var nuevo_proyectil : Bala = proyectil.instantiate()
			nuevo_proyectil.camara = camara
			print(get_tree().get_root().name)
			get_tree().get_root().add_child(nuevo_proyectil)
	if event is InputEventKey:
		if Input.is_action_just_pressed("reload"):
			pass
			# Reload
		if Input.is_action_just_pressed("Apuntar"):
			pass
			
