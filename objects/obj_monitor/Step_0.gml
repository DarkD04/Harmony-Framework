/// @description Script
	//Always enable flag
	collision_flag = true;
	
	//Disable flag when attacking
	if(obj_player.animation = ANIM_ROLL && player_collide_object(C_BOTTOM_EXT) || obj_player.animation = ANIM_ROLL && obj_player.y_speed >= 16  || obj_player.state = ST_SPINDASH && !player_collide_object(C_BOTTOM_EXT) || obj_player.state = ST_ROLL || obj_player.state = ST_KNUXGLIDE)
		collision_flag = false;
	
	//Destroy the monitor
	if(!destroyed)
	{
		if(player_collide_object(C_MAIN) && !collision_flag)
		{
			destroyed = true;	
			ground = false;
			y_speed = -2;
			obj_player.y_speed = abs(obj_player.y_speed)*-1;
			create_effect(x, y, spr_effect_explosion01, 0.3);
			play_sound(sfx_destroy);
			
			//Create icons
			var icon = instance_create_depth(x, y, depth, obj_monitor_icon);
			icon.monitor_type = monitor_type;
			icon.sprite_index = monitor_icon;
		}
		
		//Bump
		if(player_collide_object(C_TOP))
		{
			//y -= ((obj_player.y - obj_player.hitbox_h) - bbox_bottom)
			collision_flag = false;
			ground = false;
			y_speed = -3;	
			obj_player.y_speed = 0;
			
		}
	}else
	{
		//No more collision
		collision_flag = false;
		
		//Destroyed sprite
		sprite_index = spr_monitor_broken;
	}
	if(!ground)
	{
		//Update position by speed
		y += y_speed;
		
		//Gravity
		if(!ground) y_speed += 0.2;
		
		
		//Collision
		while(instance_place(x, y, par_solid) && y_speed >= 0|| instance_place(x, y, par_solid_object) && y_speed >= 0)
		{
			y_speed = 0;
			if(!instance_place(x, y, obj_player))ground = true;
			y -= 1;
		}
		
	}
	
	//User event for icon
	event_user(0);