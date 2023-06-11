function player_state_normal(){
	//Stop executing if its not the specific state:
	if(state != ST_NORMAL) exit;
	
	//Change animations:

		//Default animation:
		if (ground)
		{
			animation = ANIM_STAND;
		}else
		{
			if(animation != ANIM_BREATHE)animation = ANIM_WALK;
		}
		
		//Walking animation:
		if(ground_speed != 0 || animation == ANIM_SKIDTURN)
		{
			animation = ANIM_WALK;
			if(ground)animation_set_speed = floor(max(0, 8-abs(obj_player.ground_speed)));//mfw im an accuracy whore
		}
		
		//Running animation:
		if(abs(ground_speed) >= 6)
		{
			animation = ANIM_RUN;
			if(ground)
			{
				switch(character)
				{
					case CHAR_TAILS: animation_set_speed = 1; break;
					default: animation_set_speed = floor(max(0, 8-abs(obj_player.ground_speed))); break;
				}
			}
		}
		
		//Running animation:
		if(abs(ground_speed) >= 12)
		{
			animation = ANIM_MAXRUN;
			animation_set_speed = 1;
		}
		
		//Ledge animation
		if(!line_check(0, hitbox_h+16, true) && ground_speed == 0 && ground && !on_object ||
		!check_object(0, 0, 1, hitbox_h+2, true) && ground_speed == 0 && ground && on_object)
		{
			//Change animation
			if(!line_check(hitbox_w, hitbox_h+16, true) && !check_object(-wall_w, 0, wall_w, hitbox_h+2, true))
			{
				if(facing = 1) animation = ANIM_LEDGE2; else animation = ANIM_LEDGE1;
			}
			if(!line_check(-hitbox_w, hitbox_h+16, true) && !check_object(wall_w, 0, -wall_w, hitbox_h+2, true))
			{
				if(facing = -1) animation = ANIM_LEDGE2; else animation = ANIM_LEDGE1;
			}
		}
		
	//Get input presses
	var mov = hold_right - hold_left;
		
	//Pushing animation
	if(point_check((wall_w + 1) * facing, wall_h) && mov = facing && mov != 0 && ground && abs(ground_speed) <= x_accel + 0.5||
	check_object((wall_w + 1) * facing, hitbox_h, (wall_w + 1) * facing, hitbox_h) && mov = facing && mov != 0 && ground && abs(ground_speed) <= x_accel)
	{
		animation = ANIM_PUSH;	
	}
}