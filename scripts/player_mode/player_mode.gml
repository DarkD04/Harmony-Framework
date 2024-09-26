function player_mode(){
	//Mode macros
	#macro CMODE_FLOOR 0
	#macro CMODE_RWALL 1
	#macro CMODE_CEILING 2
	#macro CMODE_LWALL 3
	
	// Taken from mania, that's why its hex angle.
    var last_mode = mode;
	var s = max(16 - floor(abs(ground_speed * 2)), 0);
	
	floor_delay = max(floor_delay - 1, 0);
	
	//Change floor modes
	if(floor_delay == 0)
	{
		switch(last_mode)
		{
			//Mode 0[On floor]:
		    case CMODE_FLOOR:
		        if (ground_angle > 45 && ground_angle <= 180)
				{
					floor_delay = s;
		            mode = CMODE_RWALL;
				}
		        if (ground_angle < 315 && ground_angle >= 180)
				{
					floor_delay = s;
		            mode = CMODE_LWALL;
				}
		    break;
		
			//Mode 1[On right wall]:
		    case CMODE_RWALL:
		        if (ground_angle <= 45)
				{
					floor_delay = s;
		            mode = CMODE_FLOOR;
				}
		        if (ground_angle >= 135)
				{
					floor_delay = s;
		            mode = CMODE_CEILING;
				}
		    break;
		
			//Mode 2[On ceiling]:
		    case CMODE_CEILING:
		        if (ground_angle < 135)
				{
					floor_delay = s;
		            mode = CMODE_RWALL;
				}
		        if (ground_angle > 225)
				{
					floor_delay = s;
		            mode = CMODE_LWALL;
				}
		    break;
		
			//Mode 3[On left wall]:
		    case CMODE_LWALL:
		        if (ground_angle < 225)
				{
					floor_delay = s;
		            mode = CMODE_CEILING;
				}
		        if (ground_angle >= 315)
				{
					floor_delay = s;
		            mode = CMODE_FLOOR;
				}
			break;
		}
	}
	
	//Change direction
	x_dir = dsin(90 * mode);
	y_dir = dcos(90 * mode);
}
