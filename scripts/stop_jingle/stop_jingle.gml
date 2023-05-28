function stop_jingle(FadeIn, Fadespeed = 1){

	with(obj_music){
		//Fade into BGM (optional)
		if(FadeIn = true){
			fade = MusicFadeIn;
			fade_speed = Fadespeed;
			fade_offset = 0;
		}
	
		//Stop the jingle here
		audio_stop_sound(playing[Jingle]);
		playing[Jingle] = noone;
		play_data[Jingle] = "";
	}
}