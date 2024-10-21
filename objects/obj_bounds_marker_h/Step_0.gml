	/// @description Script
	
	//Get player object:
	var player = instance_find(obj_player, 0);
	
	//Compare position to set camera boundary position:
	if(player.x >= bbox_left && player.x <= bbox_right)
	{	
		if(!flip)
		{
			obj_camera.target_bottom = y;
		}
		else
		{
			obj_camera.target_top = y;	
		}
	}