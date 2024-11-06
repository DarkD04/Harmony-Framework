/// @description Script	
	//Reset the flag
	collision_flag = true;
	
	switch(breakable_type)
	{
		case 0:
		//Change collision flag
		if(obj_player.state = ST_ROLL && abs(obj_player.ground_speed) >= 1 && obj_player.ground || obj_player.state = ST_SPINDASH || obj_player.character == CHAR_KNUX)
		{
			collision_flag = false;	
		}
	
		//Check if fire shield exists
		if(instance_exists(obj_fire_shield))
		{
			//If so disable collision when player hits the wall
			if(obj_player.shield == S_FIRE && obj_fire_shield.shield_state == 1) 
			{
				collision_flag = false;
			}
		}
		break;
		
		case 1:
		case 2:
			if(obj_player.state != ST_SPINDASH && obj_player.attacking && obj_player.y + obj_player.hitbox_h <= y && obj_player.y_speed >= 0)
			{
				collision_flag = false;	
			}
		break;
		case 3:
			if(obj_player.y_speed < 0)
			{
				collision_flag = false;	
			}
		break;
	}
	
	//Destroy the wall
	if(player_collide_object(C_MAIN))
	{
		switch(breakable_type)
		{
			case 1:
				obj_player.y_speed = abs(obj_player.y_speed) * -1;
			break;
			
			case 2:
				obj_player.y_speed = 0;
			break;
		}
		instance_destroy();	
	}
