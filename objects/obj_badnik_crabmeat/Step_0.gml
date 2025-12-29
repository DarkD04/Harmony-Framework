	// Inherit the parent event's code for the badnik
	event_inherited();
	animator_update(animator);
	if (on_screen()) 
	{
		// Change some values
		x += x_speed;
		y += y_speed;

		// Check for collision on ground
		if(collision_line_check(8,32, CMODE_FLOOR, PLANE_A, true) && collision_line_check(-8,32, CMODE_FLOOR, PLANE_A, true)){
			while(!collision_point_check(8, 16, CMODE_FLOOR, PLANE_A, true) && !collision_point_check(-8, 16, CMODE_FLOOR, PLANE_A, true))
			{
				y += 1;
			}
		}
		while(collision_point_check(8, 16, CMODE_FLOOR, PLANE_A, true) || collision_point_check(-8, 16, CMODE_FLOOR, PLANE_A, true))
		{
			y -= 1;
		}
		
		event_user(state)
	}