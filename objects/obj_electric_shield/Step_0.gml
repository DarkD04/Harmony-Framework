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
	
	//Double jump
	if(obj_player.press_action && !obj_player.ground && obj_player.state == ST_JUMP
	&& shield_state == 0 && use_allow) 
	{
		//Player double jump
		obj_player.y_speed = -5.5;
		
		//Switch shield state
		shield_state = 1;
		
		//Play sound
		play_sound(sfx_electric_shield_jump)
		
		//Make shield sparkles
		for (var i = 0; i < 4; ++i) 
		{
		    create_effect(x, y, spr_electric_sparks, 1, depth + 1, 2 * dsin(45+(90*i)), 2 * dcos(45+(90*i)))
		}
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