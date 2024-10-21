/// @description Script
	if(sign(image_xscale) = 1)
	{
		if(obj_player.ground_speed > 0 && player_collide_object(C_MAIN))
		{
			//Play the sound
			if(obj_player.state != ST_ROLL)
			{
				play_sound(sfx_roll);	
			}
			
			obj_player.force_roll = true;
			obj_player.state = ST_ROLL;
		}
		
		if(obj_player.ground_speed < 0 && player_collide_object(C_MAIN))
		{
			obj_player.force_roll = false;	
		}
	}
	else
	{
		if(obj_player.ground_speed < 0 && player_collide_object(C_MAIN))
		{
			//Play the sound
			if(obj_player.state != ST_ROLL)
			{
				play_sound(sfx_roll);	
			}
			
			obj_player.force_roll = true;
			obj_player.state = ST_ROLL;
		}
		
		if(obj_player.ground_speed > 0 && player_collide_object(C_MAIN))
		{
			obj_player.force_roll = false;	
		}
	}