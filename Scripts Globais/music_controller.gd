extends Node2D

func play_music():
	if $Bg_music.playing != true:
		$Bg_music.play()
