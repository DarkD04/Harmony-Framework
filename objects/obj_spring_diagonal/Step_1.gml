/// @description Script
	//Update the animator
	animator_update(animator);
	
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
	if(player_collide_object(C_MAIN) && !triggered && !inside_trigger)
	{
		//Spring code
		animator.animation_finished = false;
		inside_trigger = true;
		triggered = true;
		play_sound(sfx_spring);
			
		//Player stuff
		var player = instance_nearest(x, y, obj_player)
		with(player)
		{
			state = ST_SPRING;
			x_speed = -other.spring_power * sign(other.image_xscale);
			y_speed = -other.spring_power * sign(other.image_yscale);
			ground = false;
			ground_angle = 0;

		}
	}
	
	//Stop the animation
	if(!triggered) 
	{
		animation_set_frame(animator, 0);
	}
	
	//Reset the inside trigger
	if(!player_collide_object(C_MAIN))
	{
		inside_trigger = false;
	}
	
	//Reset the trigger
	if(animation_has_finished(animator) && triggered) 
	{
		triggered = false;
	}