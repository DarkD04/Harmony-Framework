/// @description Script
	x = floor(obj_player.x - 32);
	y = obj_water.y + (1 * abs(1-obj_player.on_object));
	
	//Change collision size
	image_xscale = 4;
	image_yscale = 0.5;
	
	//Disable flag
	collision_flag = false;
	
	//Change flag
	if(obj_player.y < y && abs(obj_player.ground_speed) >= 4 && obj_player.ground && obj_player.y_speed >= 0 && obj_player.y_speed <= 1 && obj_player.mode = 0)
		collision_flag = true;
	
	if (global.water_running_effect == 1) {
		visible = false
		//Player effect
		if(player_collide_object(C_BOTTOM) && collision_flag && FRAME_TIMER mod 4 = 0)
		{
			//Create effects
			create_effect(obj_player.x, obj_water.y, spr_water_splash, 0.35, obj_player.depth+1);
			
			//Play sound
			play_sound(sfx_water_splash);	
		}
	} else {
		//hydroplane sound looping
		if (audio_is_playing(sfx_hydroplaning)) {
			if (audio_sound_get_track_position(hydroplaning_snd) > 2.4){
				audio_sound_set_track_position(hydroplaning_snd, 0.4)
			}
		}
		
		if(player_collide_object(C_BOTTOM) && collision_flag)
		{
			//Create effects
			visible = true
			
			//Play sound
			if (!audio_is_playing(sfx_hydroplaning)) {
				hydroplaning_snd = audio_play_sound(sfx_hydroplaning, 0, true)	
				audio_sound_gain(hydroplaning_snd, global.sfx_volume, -1);
			}
		}else {
			visible = false
			if (audio_is_playing(sfx_hydroplaning)) {
				audio_stop_sound(hydroplaning_snd)
			}
		}
	}