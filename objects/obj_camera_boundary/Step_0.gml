/// @description Flip player
	if(player_collide_object(C_MAIN))
	{
		if(!triggered)
		{
			obj_camera.target_bottom = bbox_bottom;
		}
		triggered = true;	
	}else
	{
		if(triggered)
		{
			obj_camera.target_bottom = room_height;	
		}
		triggered = false;	
	}