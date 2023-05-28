/// @description Script

	//Loop by the channel amount
	for(var i = 0; i < 2; i++){
		//Music loop
		if(audio_sound_get_track_position(playing[i]) >= loop_end[i] && loop_end[i] > 0){
			audio_sound_set_track_position(playing[i], loop_start[i]);
			show_debug_message("Music has looped");
		}
		//Fade
		audio_sound_gain(playing[i], global.bgm_volume * fade_offset, 0)
		
		//Offset the fade
		var Volume = fade_speed/200;
		fade_offset += Volume * fade;
		
		//Clamp fade offset
		fade_offset = clamp(fade_offset, 0, 1);
		
		//Resume the channels
		audio_resume_sound(playing[i]);
		
		//Pause BGM when jingle is playing
		if(playing[Jingle] != noone)
			audio_pause_sound(playing[BGM]);
	}
	
	if(keyboard_check_pressed(vk_control)) audio_sound_set_track_position(playing[0], loop_end[0]-2.00);