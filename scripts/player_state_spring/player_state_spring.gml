function player_state_spring(){
	
	//Change animation
	animation_play(animator, ANIM.SPRING);
	
	//Change state when falling
	if(y_speed >= 0) 
	{
		state = player_state_normal;
	}
}