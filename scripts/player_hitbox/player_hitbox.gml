function player_hitbox(){
	//Get previous hitbox height
	old_hitbox_h = hitbox_h;
	
	//Original hitbox values
	hitbox_w = 9;
	hitbox_h = 19;
	
	//Reset camera offset if player is not playing rolling animation
	if(animation != ANIM_ROLL) obj_camera.roll_offset = 0;
	
	//Roll hitboxes
	if(animation = ANIM_ROLL)
	{
		if(state = ST_ROLL || landed) obj_camera.roll_offset = 5;
		hitbox_w = 7;
		hitbox_h = 14;
	}
	
	//Change floor position fix
	if(mode = 0 && ceiling_lock = 0)
	{
		y += (old_hitbox_h - hitbox_h) * y_dir;
	}
}