/// @description Script
	//Animation speed
	image_speed = 0.55;
	
	//Different spring types
	switch(spring_type)
	{
		case "Yellow":
			sprite_index = spr_spring_diagonal_yellow;
			spring_power = 7;
		break;
		
		case "Red":
			sprite_index = spr_spring_diagonal_red;
			spring_power = 11;
		break;
	}
	

	//Hit from the bottom
	if(player_collide_object(C_MAIN) && !triggered)
	{
		//Spring code
		triggered = true;
		play_sound(sfx_spring);
			
		//Player stuff
		var player = instance_nearest(x, y, obj_player)
		with(player)
		{

			state = ST_SPRING;
			animation = ANIM_SPRING;
			x_speed = -other.spring_power * sign(other.image_xscale);
			y_speed = -other.spring_power * sign(other.image_yscale);
			ground = false;
			ground_angle = 0;

		}
	}
	
	
	//Stop the animation
	if(!triggered) image_index = 0;
	
	//Reset the trigger
	if(image_index >= image_number-1) triggered = false;