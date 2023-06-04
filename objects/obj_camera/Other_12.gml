/// @description Return to knuckles

	//Get angle target
	var angle = point_direction(target_x, target_y, target.x, target.y);
	
	//Move towards knuckles
	target_x = approach(target_x, target.x, 2 * abs(dcos(angle)));
	target_y = approach(target_y, target.y, 2 * abs(dsin(angle)));
	
	//If state is not the ledge climb return
	if(target.state != ST_KNUXLEDGE) mode = 0;