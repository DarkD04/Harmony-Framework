/// @description Script	
	//Reset the flag
	collision_flag = true;

	//Change collision flag
	if(obj_player.state = ST_ROLL && abs(obj_player.ground_speed) >= 1 && obj_player.ground || obj_player.state = ST_SPINDASH || obj_player.character == CHAR_KNUX)
		collision_flag = false;	
	
	//Really hate GMS object man
	if(instance_exists(obj_fire_shield))
	{
		if(obj_player.shield == S_FIRE && obj_fire_shield.shield_state == 1) collision_flag = false;
	}
	//Destroy the wall
	if(player_collide_object(C_MAIN) && !collision_flag){
		instance_destroy();	
	}
