/// @description Player scripts
	
	//Step movement for sticking on the collision
	steps = 1 + abs(floor(x_speed/13)) + abs(floor(y_speed/13));
	
	//Reset landing flag
	if(ground)landed = false;
	
	//Include step movement
	repeat(steps)
	{
		//Handle player movement:
		player_movement();
		
		//Handle semi solid:
		player_semisolids();
		
		//Handle player terrain collision:
		player_collision();
		
		//Handle player angle detection
		player_angle_detection();
		
		//Handle player collision with solid objects:
		player_object_collision();
	}
	
	//Handle how player is controlled:
	player_control();

	//Handle partial visual rotation
	player_visual_angle();
	
	//Handle player's hurt system
	player_handle_hurt()
	
	//Handle player states
	player_states();
	
	//Player facing direction
	player_direction();
	
	//Handle animation system
	animation_system();
	
	//Various hitbox cases
	player_hitbox();
	
	//Misc. player stuff
	player_misc();
	
	//Handle player's interaction with water
	player_water();