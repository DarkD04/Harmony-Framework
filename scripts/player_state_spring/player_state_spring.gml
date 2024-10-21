function player_state_spring(){
	//If its not in spring state exit
	if(state != ST_SPRING) exit;
	
	//Change animation
	animation_play(animator, ANIM_SPRING);
	
	//Change state when falling
	if(y_speed >= 0) 
	{
		state = ST_NORMAL;
	}
}