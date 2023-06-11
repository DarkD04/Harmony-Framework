function player_handle_physics(){
	//Physics values
	x_accel = (0.046875 * (1 + speed_shoes_flag)) / (1 + underwater);
	if(state != ST_TAILSFLY) y_accel = 0.21875;
	friction_speed = (0.046875 * (1 + speed_shoes_flag)) / (1 + underwater);
	top_speed = (6 * (1 + speed_shoes_flag)) / (1 + underwater);
	jump_strenght = 6.5;
	
	if(character = CHAR_KNUX) jump_strenght = 6;
	
	if(underwater)
	{
		if(state != ST_TAILSFLY) y_accel = 0.0625;
		jump_strenght = 3.5;	
		if(character = CHAR_KNUX) jump_strenght = 6;
	}
}