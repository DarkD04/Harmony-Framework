/// @description Script
	
	//Update speeds
	x += x_speed;
	y += y_speed;
	
	//Gravity
	y_speed += grav;
	
	//Hurt the player
	if(player_collide_object(C_MAIN))
	{
		if(obj_player.shield == S_NONE)
		{
			player_hurt();
		}
		else
		{
			if(!bounce)
			{
				var angle = point_direction(x, y, obj_player.x, obj_player.y);
				x_speed = 12 * -dcos(angle);
				y_speed = 12 * dsin(angle);
				grav = 0;
				bounce = true;
			}
		}
	}
	//Destroy off screen
	if(!on_screen(64, 64)) 
	{
		instance_destroy();
	}