/// @description Reset everything
	//General
	fade = MusicFadeIn;
	fade_speed = 1;
	fade_offset = 1;
	
	//Reset volume
	for(var i = 0; i < 2; i++)
		audio_sound_gain(playing[i], global.bgm_volume, 0)