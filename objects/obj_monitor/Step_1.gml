/// @description Script
	//Always enable flag
	collision_flag = true;
	
	//Get colliding player
	var player = instance_nearest(x, y, obj_player);
	
	//Disable flag when attacking
	if(player)
	{
		if(sign(image_yscale) == 1)
		{
			if(player.attacking && player.y_speed >= 0 && player.state != ST_SPINDASH || player.y + player.hitbox_h > bbox_top && player.state == ST_SPINDASH)
			{
				collision_flag = false;
			}
		}
		else
		{
			if(player.attacking && player_collide_object(C_TOP_EXT))
			{
				collision_flag = false;
			}
		}
	}

	
	//When monitor isn't destroyed
	if(!destroyed)
	{
		//Bump the monitor
		if(player_collide_object(C_TOP) && sign(image_yscale) == 1)
		{
			collision_flag = false;
			ground = false;
			y_speed = -2;	
			
			player.y_speed = 1;
			
			//Change depth
			if(layer_bump)
			{
				depth = layer_get_depth("Objects");	
			}
		}
		
		//Destroy the monitor
		if(player_collide_object(C_MAIN) && !collision_flag && player.y < bbox_bottom-1)
		{
			destroyed = true;
			ground = false;
			y_speed = -2 * sign(image_yscale);
			player.y_speed = max(abs(player.y_speed), 4) * -sign(image_yscale);
			create_effect(x, y, spr_effect_explosion01, 0.3);
			play_sound(sfx_destroy);
			
			//Create icons
			var icon = instance_create_depth(x, y, depth, obj_monitor_icon);
			icon.monitor_type = monitor_type;
			icon.sprite_index = monitor_icon;
			icon.y_speed *= sign(image_yscale);
		}
	}
	else
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
		if(!ground) 
		{
			y_speed += 0.2;
		}
		
		
		//Collision
		while(collision_instance(0, 1, 0, true, true) && y_speed >= 0)
		{
			if(!instance_place(x, y, player))
			{
				ground = true;
			}
			y -= 1;
			y = floor(y);
			y_speed = 0;
		}
		
	}
	else
	{
		y = floor(y);	
	}
	//User event for icon
	event_user(0);

	if(!on_screen() && ground && culling) 
	{
		instance_deactivate_object(id);
	}