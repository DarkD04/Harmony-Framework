/// @description Script

	//Loop by the channel amount
	for(var i = 0; i < 2; i++){
		//Music loop
		if(loop_end[i] > 0){
			audio_sound_loop_start(playing[i], loop_start[i]);
			audio_sound_loop_end(playing[i], loop_end[i]);
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
	
	if(instance_exists(obj_player))
	{
		//Drowning jingle
		if(audio_is_playing(j_drowning) || obj_player.air > 20*60)
		{
			audio_pause_sound(playing[BGM]);
			audio_sound_gain(playing[Jingle], 0, 0);
			audio_sound_gain(j_drowning, 1, 0);
		}
	
		//Handle extra life jingle
		if(audio_is_playing(j_extra_life))
		{
			audio_pause_sound(playing[BGM]);
			audio_sound_gain(playing[Jingle], 0, 0);
			audio_sound_gain(j_drowning, 0, 0);
			fade_offset = 0;
			fade_speed = 2;
		}
	}
	if(global.dev_mode && keyboard_check_pressed(vk_control)) audio_sound_set_track_position(playing[0], loop_end[0]-2.00);