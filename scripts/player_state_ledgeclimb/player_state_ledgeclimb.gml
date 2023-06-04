function player_state_ledgeclimb(){
	//Stop executing if its not specific state
	if(state != ST_KNUXLEDGE) exit;
	
	//Change flags
	movement_allow = false;
	direction_allow = false;
	gravity_allow = false;
	can_collide = false;
	
	//Change animation
	animation = ANIM_KNUXLEDGE;
	
	//values for ofsets during animation
	var positionarrayx = [0, 0, 11, 22, 22];
	var positionarrayy = [0,-16, -25, -20, -18];
	
	//set position
	x = clamp_storex + (positionarrayx [image_index] * facing);
	y = clamp_storey + positionarrayy [image_index];
	y_speed = 0
	
	//Animation is over, return to normal state
	if(animation_frame = image_number - 1 && control_lock = 0) state = ST_NORMAL;
}