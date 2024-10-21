function player_state_lookdown(){
	//Trigger look down:
	if(state == ST_NORMAL || state == ST_KNUXFALL)
	{
		if(ground && abs(ground_speed) < 1 && mode = 0 && hold_down)
		{
			state = ST_LOOKDOWN;
		}
	}
	
	//Stop executing
	if(state != ST_LOOKDOWN) 
	{
		exit;
	}
	
	//Change flags
	movement_allow = false;
	direction_allow = false; 
	
	//Change animation
	animation_play(animator, ANIM_LOOKDOWN);
	
	//Slow crouch
	ground_speed = approach(ground_speed, 0, friction_speed);
	
	//Slope influence
	if(ground_angle >= 40 && ground_angle <= 320) 
	{
		ground_speed -= 0.125 * dsin(ground_angle);
	}
	
	//Stop crouching when releasing the down key
	if(!hold_down) 
	{
		state = ST_NORMAL;
	}
}