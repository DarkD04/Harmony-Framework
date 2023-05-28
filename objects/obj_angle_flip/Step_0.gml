/// @description Flip player
	if(player_collide_object(C_MAIN))
	{
		if(!triggered)
		{
			obj_player.ground_angle += 180;
			obj_player.visual_angle += 180;
			obj_player.mode = 1
			obj_player.detach_allow = false
			obj_player.ground_speed *= -1;
		}
		triggered = true;	
	}else
	{
		triggered = false;	
	}