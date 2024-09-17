/// @description Values
	triggered = false;
	showing_stars = false;
	angle = 0;
	
	star_timer = 0;
	star_type = 0;
	star_angle_x = 0;
	star_angle_y = 0;
	star_radius = 0;
	star_frame = 0;
	
	star_ydiff = 72; //accurate is 60
	
	//Set all checkpoints to be triggered
	if(ds_list_find_index(global.checkpoint, id) != -1)
	{
		triggered = true;
		angle = 720;
	}