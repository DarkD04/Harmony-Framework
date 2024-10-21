/// @description Script
	
	//Fade events for general fade
	var volume = general_fade_speed / 100;
	general_fade_multiplier += volume * general_fade;
	
	//Clamp the general fade
	general_fade_multiplier = clamp(general_fade_multiplier, 0, 1);
	
	//Apply fade and background volume to the extra life jingle
	audio_sound_gain(j_extra_life, global.bgm_volume, 0);
	
	//Loop by the channel amount
	for(var i = 0; i < channel_size; i++)
	{
		if(playing[i] != noone && audio_is_playing(playing[i]))
		{	
			//Music loop
			audio_sound_loop_start(playing[i], loop_start[i]);
			if(loop_end[i] > 0) 
			{
				audio_sound_loop_end(playing[i], loop_end[i]);
			}
		
			//Set volume to the fade and background volume
			audio_sound_gain(playing[i], global.bgm_volume * fade_multiplier[i] * general_fade_multiplier, 0)
		
			//Offset the fade
			var volume = fade_speed[i] / 100;
			fade_multiplier[i] += volume * fade_type[i];
		
			//Clamp fade offset
			fade_multiplier[i] = clamp(fade_multiplier[i], 0, 1);
			
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
				if(playing[i] != noone && channel_size != i)
				{
					audio_pause_sound(playing[i]);
				}
				
				if(playing[Jingle] != noone)
				{
					audio_sound_gain(playing[Jingle], 0, 0);
				}
			
				audio_sound_gain(j_drowning, global.bgm_volume, 0);
			}
	
			//Handle extra life jingle
			if(audio_is_playing(j_extra_life))
			{
				if(playing[i] != noone && channel_size != i)
				{
					audio_pause_sound(playing[i]);
				}
				
				if(playing[Jingle] != noone)
				{
					audio_sound_gain(playing[Jingle], 0, 0);
				}
			
				audio_sound_gain(j_drowning, 0, 0);
				
				general_fade_multiplier = 0;
				general_fade_speed = 2;
			}
		}
	}
	