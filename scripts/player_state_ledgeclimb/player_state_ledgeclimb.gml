function player_state_ledgeclimb(){
	//Stop executing if its not specific state
	if(state != ST_KNUXLEDGE) 
	{
		exit;
	}
	
	//Change flags
	movement_allow = false;
	direction_allow = false;
	gravity_allow = false;
	collision_allow = false;
	
	//Change animation
	animation_play(animator, ANIM_KNUXLEDGE);
	
	//Temp values
	var positionarrayx, positionarrayy, length, frame;
	
	//Values for ofsets during animation
	positionarrayx = [0, 0, 11, 22, 22];
	positionarrayy = [0,-16, -25, -20, -19];
	
	//Get array length
	length = array_length(positionarrayx) - 1;
	frame = animation_get_frame(animator);
	
	//set position
	x = clamp_storex + positionarrayx[min(frame, length)] * facing;
	y = clamp_storey + positionarrayy[min(frame, length)];
	x_speed = 0;
	y_speed = 0
	
	//Set camera target
	obj_camera.knux_offset_x = clamp_storex + (positionarrayx[length] * facing);
	obj_camera.knux_offset_y = clamp_storey + positionarrayy[length];
	
	//Animation is over, return to normal state
	if(animation_has_finished(animator) && control_lock = 0) 
	{
		ground_speed = 0;
		ground = true;
		animation_play(animator, ANIM_STAND);
		collision_allow = true;
		state = ST_NORMAL;
	}
}