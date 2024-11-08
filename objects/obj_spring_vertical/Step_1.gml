	/// @description On wall spring event
	
	//Facing upwards
	if(sign(image_yscale) = 1)
	{
		//Hit from the bottom
		if(player_collide_object(C_BOTTOM) && obj_player.y_speed >= 0 && obj_player.mode != 0)
		{
			//Spring code
			animator.animation_finished = false;
			triggered = true;
			play_sound(sfx_spring);
			
			//Player stuff
			var player = instance_nearest(x, y, obj_player)
			with(player)
			{
				switch(mode)
				{
					case 1:
					facing = 1;
					ground_speed = other.spring_power;
					break;
					
					case 3:
					facing = -1;
					ground_speed = -other.spring_power;
					break;
				}
			}
		}
	}
	
		//Facing upwards
	if(sign(image_yscale) = -1)
	{		
		//Hit from the bottom
		if(player_collide_object(C_TOP) && obj_player.mode != 0)
		{
			//Spring code
			animator.animation_finished = false;
			triggered = true;
			play_sound(sfx_spring);
			
			//Player stuff
			var player = instance_nearest(x, y, obj_player)
			with(player)
			{
				switch(mode)
				{
					case 1:
					facing = -1;
					ground_speed = -other.spring_power;
					break;
					
					case 3:
					facing = 1;
					ground_speed = other.spring_power;
					break;
				}
			}
		}
	}