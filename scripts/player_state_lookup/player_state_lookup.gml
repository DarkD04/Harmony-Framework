function player_state_lookup(){
	//Trigger look down:
	if(state == ST_NORMAL && ground && abs(ground_speed) < 0.5 && mode = 0 && hold_up)
	{
		state = ST_LOOKUP;
	}
	
	//Stop executing
	if(state != ST_LOOKUP) exit;
	
	//Change flags
	movement_allow = false;
	direction_allow = false; 
	
	//Change animation
	animation_play(animator, ANIM_LOOKUP);
	
	//Slow crouch
	ground_speed = approach(ground_speed, 0, friction_speed);
	
	//Release
	if(!hold_up) 
	{
		state = ST_NORMAL;
	}
}