extends Control

var popup_instance
var tween_running = false
var original_scale = Vector2(0.7, 0.7)
var enlarged_scale = Vector2(0.8, 0.8)

func _ready():
	$gop.focus_mode = Control.FOCUS_NONE
	$dica.focus_mode = Control.FOCUS_NONE
	$desafio.focus_mode = Control.FOCUS_NONE
	$gameover.focus_mode = Control.FOCUS_NONE
	$campeao.focus_mode = Control.FOCUS_NONE

func _on_gop_pressed():
	$clique.play()
	yield(get_tree().create_timer(0.3), "timeout")
	popup_instance = preload("res://cena/level_game.tscn").instance()
	add_child(popup_instance)

func _on_dica_pressed():
	$clique.play()
	yield(get_tree().create_timer(0.3), "timeout")
	popup_instance = preload("res://cena/level_gamedica.tscn").instance()
	add_child(popup_instance)

func _on_desafio_pressed():
	$clique.play()
	yield(get_tree().create_timer(0.3), "timeout")
	popup_instance = preload("res://cena/level_gamedesafio.tscn").instance()
	add_child(popup_instance)

func _on_gopi_mouse_entered():
	$tween.interpolate_property($gop/gopi, "rect_scale", original_scale, enlarged_scale, 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$tween.start()

func _on_gopi_mouse_exited():
	$tween.interpolate_property($gop/gopi, "rect_scale", enlarged_scale, original_scale, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$tween.start()


func _on_dic_mouse_entered():
	$tween.interpolate_property($dica/dic, "rect_scale", original_scale, enlarged_scale, 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$tween.start()

func _on_dic_mouse_exited():
	$tween.interpolate_property($dica/dic, "rect_scale", enlarged_scale, original_scale, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$tween.start()


func _on_tween_tween_completed(object, key):
	tween_running = false


func _on_desa_mouse_entered():
	$tween.interpolate_property($desafio/desa, "rect_scale", original_scale, enlarged_scale, 0.25, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$tween.start()


func _on_desa_mouse_exited():
	$tween.interpolate_property($desafio/desa, "rect_scale", enlarged_scale, original_scale, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$tween.start()


func _on_gameover_pressed():
	get_tree().change_scene("res://cena/GameOver.tscn")


func _on_campeao_pressed():
	get_tree().change_scene("res://cena/Campeao.tscn")
