/// @description Script
	//Update the animator
	animator_update(animator);
	
	//Facing upwards
	if(sign(image_yscale) = 1)
	{
		//Hit from the bottom
		if(player_collide_object(C_BOTTOM) && obj_player.y_speed >= 0)
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
					case 0:
					animation_play(animator, ANIM_SPRING);
					state = ST_SPRING;
					y_speed = -other.spring_power;
					ground = false;
					break;
					
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
		if(player_collide_object(C_TOP))
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
					case 0:
					state = ST_SPRING;
					y_speed = other.spring_power;
					ground = false;
					break;
					
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
	
	//Stop the animation
	if(!triggered) 
	{
		animation_set_frame(animator, 0);
	}
	
	//Reset the trigger
	if(animation_has_finished(animator) && triggered) 
	{
		triggered = false;
	}