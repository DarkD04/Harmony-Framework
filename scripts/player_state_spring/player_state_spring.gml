function player_state_spring(){
	//If its not in spring state exit
	if(state != ST_SPRING) exit;
	
	//Change animation
	animation = ANIM_SPRING;
	
	//Change to walk animation when falling
	if(y_speed >= 0) {
	state = ST_NORMAL;
	exit;
	}
	
	//Change state when on ground
	if(ground) state = ST_NORMAL;
}