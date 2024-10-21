/// @description Script
	//Update the animator
	animator_update(animator);
	
	//Get player's instance
	var player = instance_nearest(x, y, obj_player);
	
	//Get player's speed
	var player_speed = player.ground ? player.ground_speed : player.x_speed;
	
	//Facing upwards
	if(sign(image_xscale) = 1)
	{
		//Hit from the bottom
		if(player_collide_object(C_RIGHT) && player_speed >= 0)
		{
			//Spring code
			triggered = true;
			animator.animation_finished = false;
			play_sound(sfx_spring);
			
			with(player)
			{
				switch(mode)
				{
					
					case 0:
					facing = -1;
					x_speed = -other.spring_power;
					ground_speed = -other.spring_power;
					control_lock = 20;
					
					//Knuckles fix
					if(state = ST_KNUXGLIDE || state = ST_KNUXSLIDE || state = ST_KNUXCLIMB) 
					{
						state = ST_NORMAL;
					}
					break;
					
					case 2:
					facing = 1;
					ground_speed = other.spring_power;
					break;
				}
			}
		}
	}
	
		//Facing upwards
	if(sign(image_xscale) = -1)
	{		
		//Hit from the bottom
		if(player_collide_object(C_LEFT) && player_speed <= 0)
		{
			//Spring code
			triggered = true;
			animator.animation_finished = false;
			play_sound(sfx_spring);
			
			with(player)
			{
				switch(mode)
				{
					case 0:
					facing = 1;
					ground_speed = other.spring_power;
					x_speed = other.spring_power;
					control_lock = 20;
					
					//Knuckles fix
					if(state = ST_KNUXGLIDE || state = ST_KNUXSLIDE || state = ST_KNUXCLIMB) 
					{
						state = ST_NORMAL;
					}
					break;
					
					case 2:
					facing = -1;
					ground_speed = -other.spring_power;
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