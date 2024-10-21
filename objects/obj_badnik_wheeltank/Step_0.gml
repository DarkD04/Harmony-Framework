	// Inherit the parent event's code for the badnik
	event_inherited();

	// Move the badnik when the wait timer is at 0
	if (waittimer == 0)
	{
		x += badnikdirection;
	}

	// Do frame calculation for the animation frames
	badnikframe += 0.3
	image_index = floor(badnikframe)

	// Scale badnik in accordance to its direction
	image_xscale = badnikdirection

	// Check for ground
	while(collision_line_check(0, 16,,, true))
	{
		y_speed = 0;
		grounded = true;
		y -= 1;
	}

	// Push badnik upwards
	while(!collision_line_check(0, 16,,, true) && collision_line_check(0, 32,,, true))
	{
		y += 1;
	}

	// Check for two conditions for the badnik turning:
	// Condition 1: Badnik is colliding with wall in its movement direction in the middle
	// Condition 2: Badnik has no ground underneath it/slope for it is too steep
	if(!collision_line_check(badnikdirection * 6, 32,,, true)) 
	{
		if(waittimer == 0 && grounded) 
		{ // This should be done when wait timer is at 0 so event doesn't loop repeatedly
			waittimer = 60; // 60 frames = 1 second
		}
	}

	// Check if waiting timer is 1 and turn the badnik
	if(waittimer == 1)
	{
		badnikdirection *= -1;
	}

	// Decrease the waiting timer afterward
	waittimer = max(waittimer-1,0);

