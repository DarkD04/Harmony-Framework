/// @description Script
	//Get player object
	var player = instance_nearest(x, y, obj_player);
	
	//Get current segment
	current_segment = (player.x - x) / 16;
	
	//Limit the current segment
	current_segment = clamp(current_segment, 0, log_amount - 1);
	
	//Get max dipping
	if(current_segment <= log_amount / 2)
	{
		max_dip = current_segment * 2;
	}else
	{
		max_dip = (log_amount-current_segment) * 2;
	}
	
	//Player standing on the bridge
	if(player_collide_object(C_BOTTOM) && player.mode = 0 && player.ground && player.x > bbox_left && player.x < bbox_right)
	{
		player.y = bbox_top - player.hitbox_h - 1;
		standing = true;
	}else
	{
		standing = false;	
	}
	
	//Bubble shield effect
	if(instance_exists(obj_bubble_shield) && obj_bubble_shield.shield_state = 1 && player.ground)
	{
		stand_offset = 1;
	}
	//Make bridge dip when you land
	stand_offset = lerp(stand_offset, standing, 0.35);
	
	//When you land on it
	max_dip *= stand_offset;
	
	
	//Log code
	for (var i = 0; i < log_amount; ++i){
		//Temp values
		var log_diff, log_dist;
		
		//Log difference
		log_diff = abs(i - current_segment);
		
		//Log distance
		if(i < current_segment)
		{
			log_dist = 1 - (log_diff / current_segment);
		}else
		{
			log_dist = 1 - (log_diff / (log_amount-current_segment));	
		}
		
		//Position the log
		log_y[i] = ystart + (max_dip*dsin(log_dist * 90));
		
		//Position the hitbox
		y = log_y[floor(current_segment)];
	}