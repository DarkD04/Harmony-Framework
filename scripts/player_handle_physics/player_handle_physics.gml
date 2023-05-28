function player_handle_physics(){
	//Physics values
	x_accel = (0.046875 * (1 + speed_shoes_flag)) / (1 + underwater);
	y_accel = 0.21875;
	friction_speed = (0.046875 * (1 + speed_shoes_flag)) / (1 + underwater);
	top_speed = (6 * (1 + speed_shoes_flag)) / (1 + underwater);
	jump_strenght = 6.5;
	if(underwater)
	{
		y_accel = 0.0625;
		jump_strenght = 3.5;	
	}
}