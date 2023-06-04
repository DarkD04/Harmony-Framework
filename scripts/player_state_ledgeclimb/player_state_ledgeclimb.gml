function player_state_ledgeclimb(){
	//Stop executing if its not specific state
	if(state != ST_KNUXLEDGE) exit;
	
	//Change flags
	movement_allow = false;
	direction_allow = false;
	gravity_allow = false;
	collision_allow = false;
	ground_collision_allow = false;
	
	//Change animation
	animation = ANIM_KNUXLEDGE;
	
	//Values for ofsets during animation
	var positionarrayx = [0, 0, 11, 22, 22];
	var positionarrayy = [0,-16, -25, -20, -18];
	
	//Get array length
	var length = array_length(positionarrayx) - 1;
	
	//set position
	x = clamp_storex + (positionarrayx[min(image_index, length)] * facing);
	y = clamp_storey + positionarrayy[min(image_index, length)];
	x_speed = 0;
	y_speed = 0
	
	//Set camera target
	obj_camera.knux_offset_x = clamp_storex + (positionarrayx[length] * facing);
	obj_camera.knux_offset_y = clamp_storey + positionarrayy[length];
	
	//Animation is over, return to normal state
	if(animation_frame = image_number - 1 && control_lock = 0) state = ST_NORMAL;
}