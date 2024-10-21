/// @description Player scripts
	
	//Step movement for sticking on the collision
	steps = 1 + abs(floor(x_speed/13)) + abs(floor(y_speed/13));
	
	//Reset landing flag
	if(ground)
	{
		landed = false;
	}
	
	//Set angle sensor reach range
	if(!landed)
	{
		reach_range = 16;
	}

	//Cancel when in debug mode
	if(debug)
	{
		player_debug();
		exit;	
	}
	
	//Include step movement
	repeat(steps)
	{
		//Handle player movement:
		player_movement();
		
		//Handle semi solid:
		player_semisolids();
		
		//Handle player collision with solid objects:
		player_object_collision();
		
		//Handle player terrain collision:
		player_collision();
		
		//Handle how player changes floor modes:
		player_mode();	
	}
	
	//Handle how player is controlled:
	player_control();

	//Handle player's hurt system
	player_handle_hurt()
	
	//Update player's animator
	animator_update(animator);
	
	//Handle player states
	player_states();
	
	//Player facing direction
	player_direction();
	
	//Handle partial visual rotation
	player_visual_angle();
	
	//Various hitbox cases
	player_hitbox();
	
	//Misc. player stuff
	player_misc();
	
	//Handle player's interaction with water
	player_water();