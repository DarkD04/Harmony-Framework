/// @description Script
	//Animation speed
	image_speed = 0.55;
	
	//Different spring types
	switch(spring_type)
	{
		case "Yellow":
			sprite_index = spr_spring_vertical_yellow;
			spring_power = 10;
		break;
		
		case "Red":
			sprite_index = spr_spring_vertical_red;
			spring_power = 16;
		break;
	}
	
	//Facing upwards
	if(sign(image_yscale) = 1)
	{
		//Hit from the bottom
		if(player_collide_object(C_BOTTOM))
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
					state = ST_SPRING;
					animation = ANIM_SPRING;
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
	if(!triggered) image_index = 0;
	
	//Reset the trigger
	if(image_index >= image_number-1) triggered = false;