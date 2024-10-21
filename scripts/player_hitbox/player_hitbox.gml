function player_hitbox(){
	//Get previous hitbox height
	var old_hitbox_h = hitbox_h;
	
	//Reset camera offset if player is not playing rolling animation
	if(!animation_is_playing(animator, ANIM_ROLL)) 
	{
		obj_camera.roll_offset = 0;
	}
	
	//Original hitbox values
	hitbox_w = hitbox_normal[global.character][0];
	hitbox_h = hitbox_normal[global.character][1];
	
	//Roll hitboxes
	if(animation_is_playing(animator, ANIM_ROLL) || animation_is_playing(animator, ANIM_DROPDASH) || state == ST_JUMP)
	{
		//Change the camera offset for rolling
		if(ground || landed)
		{
			obj_camera.roll_offset = camera_rolling_offset[global.character];
		}
		
		//Change the hitbox for rolling animation
		hitbox_w = hitbox_rolling[global.character][0];
		hitbox_h = hitbox_rolling[global.character][1];
	}
	
	//Knuckles specific hitboxes
	if(state == ST_KNUXGLIDE || state == ST_KNUXSLIDE)
	{
		hitbox_h = 10;
	}
	
	//Change floor position when jumping or when on ground
	if(ceiling_lock = 0 && ground || state == ST_JUMP && mode == 0)
	{
		x += (old_hitbox_h - hitbox_h) * x_dir;
		y += (old_hitbox_h - hitbox_h) * y_dir;
	}
	
	//Crouch hitbox offset
	if(animation_is_playing(animator, ANIM_LOOKDOWN))
	{
		hitbox_top_offset = -hitbox_normal[global.character][1];
	}
	

}