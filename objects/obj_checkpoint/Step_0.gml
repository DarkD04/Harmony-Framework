/// @description Script
	//Render it behind the player
	depth = obj_player.depth + 1;
	
	//Hit the checkpoint
	if(player_collide_object(C_MAIN) && !triggered)
	{
		//Trigger the checkpoint
		triggered = true;
		
		//if global.rings >= 30
		//{
			showing_stars = true
			star_type = 4
		//}
		
		//Store checkpoint ID
		global.checkpoint_id = id;
		
		//Store checkpoint timer
		global.time_store = global.stage_timer;
		
		//Store checkpoint ID so all checkpoints can be active during the start
		ds_list_add(global.checkpoint, id);
		
		//Play sound
		play_sound(sfx_checkpoint);
	}
	
	//Spin the checkpoint
	if(triggered)
	{
		angle = approach(angle, -720, 22.5);	
	}
	
	if(showing_stars)
	{
		star_angle_x = (star_angle_x + 18) mod 512;
		star_angle_y = (star_angle_y + 4) mod 512;
		
		if star_timer < 128 {star_radius++}
		if star_timer > 384 {star_radius--} //472 in Mania 
		star_timer++
		
		if (star_timer == 512) //600 in Mania (You can add "|| !on_screen()" but it sucks)
		{
			showing_stars = false;
			star_timer = 0;
			star_type = 0;
		}
		
		var xoffset = ((star_radius >> 1)/2)+obj_player.hitbox_w
		var yoffset = 4+obj_player.hitbox_h
		
		if (star_timer > 60 && obj_player.x > x-xoffset && obj_player.x < x+xoffset && obj_player.y > y-yoffset-star_ydiff+6 && obj_player.y < y+yoffset-star_ydiff+6)
		{
			show_debug_message("Hello! You should be in the Bonus/Special stage now.")
			//Please add it dark..
		}
	}