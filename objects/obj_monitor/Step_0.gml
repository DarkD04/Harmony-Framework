/// @description Script
	//Always enable flag
	collision_flag = true;
	
	//Disable flag when attacking
	if(sign(image_yscale) == 1)
	{
		if(obj_player.animation = ANIM_ROLL && player_collide_object(C_BOTTOM_EXT) || obj_player.animation = ANIM_DROPDASH && player_collide_object(C_BOTTOM_EXT) || obj_player.animation = ANIM_ROLL && obj_player.y_speed >= 16  || obj_player.state = ST_SPINDASH && !player_collide_object(C_BOTTOM_EXT) || obj_player.state = ST_ROLL || obj_player.state = ST_KNUXGLIDE)
		{
			collision_flag = false;
		}
	}else
	{
		if(obj_player.attacking && player_collide_object(C_TOP_EXT))
		{
			collision_flag = false;
		}
	}
	//Destroy the monitor
	if(!destroyed)
	{
		if(player_collide_object(C_MAIN) && !collision_flag)
		{
			destroyed = true;	
			ground = false;
			y_speed = -2 * sign(image_yscale);
			obj_player.y_speed = abs(obj_player.y_speed)* -sign(image_yscale);
			create_effect(x, y, spr_effect_explosion01, 0.3);
			play_sound(sfx_destroy);
			//audio_sound_pitch(sfx_destroy, random_range(0.8, 1.2))
			
			//Create icons
			var icon = instance_create_depth(x, y, depth, obj_monitor_icon);
			icon.monitor_type = monitor_type;
			icon.sprite_index = monitor_icon;
			icon.y_speed *= sign(image_yscale);
		}
		
		//Bump
		if(player_collide_object(C_TOP) && sign(image_yscale) == 1)
		{
			collision_flag = false;
			ground = false;
			y_speed = -2;	
			obj_player.y_speed = 0;
			
		}
	}else
	{
		//No more collision
		collision_flag = false;
		
		//Destroyed sprite
		sprite_index = spr_monitor_broken;
		
		//Flip it back
		image_yscale = 1;
	}
	if(!ground)
	{
		//Update position by speed
		y += y_speed;
		
		//Gravity
		if(!ground) y_speed += 0.2;
		
		
		//Collision
		while(instance_place(x, y,[layer_tilemap_get_id(global.col_tile[0]), layer_tilemap_get_id(global.col_tile[1])]) && y_speed >= 0|| instance_place(x, y, par_solid_object) && y_speed >= 0)
		{
			y_speed = 0;
			if(!instance_place(x, y, obj_player))ground = true;
			y -= 1;
		}
		
	}
	
	//User event for icon
	event_user(0);

	if(!on_screen() && ground) instance_deactivate_object(id);