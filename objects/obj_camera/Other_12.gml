/// @description Return to knuckles

	//Get angle target
	var angle = point_direction(target_x, target_y, knux_offset_x, knux_offset_y);
	
	//Move towards knuckles
	target_x = approach(target_x, knux_offset_x, 2 * abs(dcos(angle)));
	target_y = approach(target_y, knux_offset_y, 2 * abs(dsin(angle)));
	
	//If state is not the ledge climb return
	if(target.state != ST_KNUXLEDGE) 
	{
		mode = 0;
	}