/// @description Script
	//Update the animator
	animator_update(animator);
	
	//Order change
	if(animation_get_frame(animator) <= 12 || animation_get_frame(animator) >= 20) 
	{
		depth = obj_player.depth - 10;
	}
	else
	{
		depth = obj_player.depth + 10;
	}
	
	//Reset state flag
	if(shield_state == 1 && obj_player.ground)
	{
		shield_state = false;	
	}
	
	//Ring magnet
	with(obj_ring)
	{
		if(distance_to_object(other) < 64)
		{
			magnet = true;
		}
	}
	
	//Begone when underwater
	if(obj_player.underwater) obj_player.shield = S_NONE;