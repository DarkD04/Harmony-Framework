/// @description Script
	//Animation speed
	image_speed = 0.55;
	
	//Different spring types
	switch(spring_type)
	{
		case "Yellow":
			sprite_index = spr_spring_horizontal_yellow;
			spring_power = 10;
		break;
		
		case "Red":
			sprite_index = spr_spring_horizontal_red;
			spring_power = 16;
		break;
	}
	
	//Facing upwards
	if(sign(image_xscale) = 1)
	{
		//Hit from the bottom
		if(player_collide_object(C_RIGHT))
		{
			//Spring code
			triggered = true;
			play_sound(sfx_spring);
			
			//Player stuff
			var player = instance_nearest(x, y, obj_player)
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
					if(state = ST_KNUXGLIDE || state = ST_KNUXSLIDE || state = ST_KNUXCLIMB) state = ST_NORMAL;
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
		if(player_collide_object(C_LEFT))
		{
			//Spring code
			triggered = true;
			play_sound(sfx_spring);
			
			//Player stuff
			var player = instance_nearest(x, y, obj_player)
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
					if(state = ST_KNUXGLIDE || state = ST_KNUXSLIDE || state = ST_KNUXCLIMB) state = ST_NORMAL;
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
	if(!triggered) image_index = 0;
	
	//Reset the trigger
	if(image_index >= image_number-1) triggered = false;