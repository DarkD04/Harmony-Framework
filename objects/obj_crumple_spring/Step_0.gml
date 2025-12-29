/// @description Script
	//Update the animator
	if (!crumple) {
		animator_update(animator);
	
		//Hit from the bottom
		if(player_collide_object(C_BOTTOM) && obj_player.y_speed >= 0 && collision_flag)
		{
			//Spring code
			animator.animation_finished = false;
			triggered = true;
			play_sound(sfx_spring);
			
			//Player stuff
			var player = instance_nearest(x, y, obj_player)
			with(player)
			{
				animation_play(animator, ANIM.SPRING);
				state = player_state_spring;
				y_speed = -other.spring_power;
				ground = false;
			}
		}
		
		//Stop the animation
		if(!triggered) 
		{
			animation_set_frame(animator, 0);
		}
	
		//Reset the trigger
		if(animation_has_finished(animator) && triggered && !crumple) 
		{
			triggered = false;
			crumple = true
			play_sound(sfx_break1)
		}
	}
	
	if (crumple) {
		if (!on_screen()){
			collision_flag = false	
			visible = false
			fall_speed = 0
		}
		y += fall_speed
		fall_speed += 0.21
	}
	