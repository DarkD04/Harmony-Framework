	// Inherit the parent event's code for the badnik
	event_inherited();

	// Change some values
	y_speed += 0.18; // Gravity
	x += x_speed;
	y += y_speed;

	// Check for collision on ground
	while(collision_point_check(0, 0, CMODE_FLOOR, PLANE_A, true) && y_speed > 0)
	{
		x_speed *= -1;
		y_speed = -5;
		y -= 1;
		badnikframe = 0
		if (on_screen()) 
		{
			// Play spring sound ONLY when on screen
			play_sound(sfx_spring);
		} 
	}

	// Visuals etc
	image_xscale = sign(x_speed); // Point badnik in the direction of the speed in which it's going
	badnikframe += 0.2;
	image_index = min(floor(badnikframe),2); //Limit until 2 for the frame