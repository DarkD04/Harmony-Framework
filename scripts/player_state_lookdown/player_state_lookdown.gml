function player_state_lookdown(){
	//Trigger look down:
	if(state == ST_NORMAL && ground && abs(ground_speed) < 1 && mode = 0 && hold_down)
	{
		animation = ANIM_LOOKDOWN;
		state = ST_LOOKDOWN;
	}
	
	//Stop executing
	if(state != ST_LOOKDOWN) exit;
	
	//Change flags
	movement_allow = false;
	direction_allow = false; 
	
	//Change animation
	animation = ANIM_LOOKDOWN;
	
	//Slow crouch
	ground_speed = approach(ground_speed, 0, friction_speed);
	
	//Slope influence
	if(ground_angle >= 40 && ground_angle <= 320) ground_speed -= 0.125 * dsin(ground_angle);
	
	//Release
	if(!hold_down) state = ST_NORMAL;
}