function player_state_ledgeclimb(){
	//Stop executing if its not specific state
	if(state != ST_KNUXLEDGE) exit;
	
	//Change flags
	movement_allow = false;
	direction_allow = false;
	
	//Change animation
	animation = ANIM_KNUXLEDGE;
	
	//Animation is over, return to normal state
	if(animation_frame = image_number - 1 && control_lock = 0) state = ST_NORMAL;
}