/// @description Script
	//Update the animator
	animator_update(animator);
	
	//Facing upwards
	if(sign(image_yscale) = 1)
	{
		//Hit from the bottom
		if(player_collide_object(C_BOTTOM) && obj_player.y_speed >= 0 && obj_player.mode == 0)
		{
			//Spring code
			animator.animation_finished = false;
			triggered = true;
			play_sound(sfx_spring);
			
			//Player stuff
			var player = instance_nearest(x, y, obj_player)
			with(player)
			{
				animation_play(animator, ANIM_SPRING);
				state = ST_SPRING;
				y_speed = -other.spring_power;
				ground = false;
			}
		}
	}
	
		//Facing upwards
	if(sign(image_yscale) = -1)
	{		
		//Hit from the bottom
		if(player_collide_object(C_TOP) && obj_player.mode == 0)
		{
			//Spring code
			animator.animation_finished = false;
			triggered = true;
			play_sound(sfx_spring);
			
			//Player stuff
			var player = instance_nearest(x, y, obj_player)
			with(player)
			{
				state = ST_SPRING;
				y_speed = other.spring_power;
				ground = false;
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