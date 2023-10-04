function player_hitbox(){
	//Get previous hitbox height
	old_hitbox_h = hitbox_h;
	
	//Reset camera offset if player is not playing rolling animation
	if(animation != ANIM_ROLL) obj_camera.roll_offset = 0;
	
	switch(character)
	{
		case CHAR_SONIC:
		//Original hitbox values
		hitbox_w = 9;
		hitbox_h = 19;
	
		//Roll hitboxes
		if(animation == ANIM_ROLL || animation == ANIM_DROPDASH)
		{
			if(ground || landed)obj_camera.roll_offset = 5;
			hitbox_w = 7;
			hitbox_h = 14;
		}
		break;
		
		case CHAR_TAILS:
		//Original hitbox values
		hitbox_w = 9;
		hitbox_h = 15;
	
		//Roll hitboxes
		if(animation == ANIM_ROLL)
		{
			if(ground || landed)obj_camera.roll_offset = 1;
			hitbox_w = 7;
			hitbox_h = 14;
		}
		break;
		
		case CHAR_KNUX:
		//Original hitbox values
		hitbox_w = 9;
		hitbox_h = 19;
	
		//Roll hitboxes
		if(animation == ANIM_ROLL)
		{
			if(ground || landed)obj_camera.roll_offset = 5;
			hitbox_w = 7;
			hitbox_h = 14;
		}
		
		//During glide
		if(state == ST_KNUXGLIDE || state == ST_KNUXSLIDE)
		{
			hitbox_h = 10;
		}
		
		//Specifically wall climb wall collision offset
		if(state = ST_KNUXCLIMB)
		{
			wall_h = 6 * sign(y_speed)
		}
		break;
	}
	
	//Change floor position fix
	if(ceiling_lock = 0 && ground || state == ST_JUMP && mode == 0)
	{
		x += (old_hitbox_h - hitbox_h) * x_dir;
		y += (old_hitbox_h - hitbox_h) * y_dir;
	}
}