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
		if(animation = ANIM_ROLL)
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
		if(animation = ANIM_ROLL)
		{
			if(ground || landed)obj_camera.roll_offset = 1;
			hitbox_w = 7;
			hitbox_h = 14;
		}
		break;
	}
	//Change floor position fix
	if(mode = 0 && ceiling_lock = 0)
	{
		y += (old_hitbox_h - hitbox_h) * y_dir;
	}
}