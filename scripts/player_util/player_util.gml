function player_reposition_mode(force_mode = -1)
{
	mode = round(ground_angle/90) % 4;
	
	var true_mode = mode;
	
	if(force_mode != -1)
	{
		true_mode = force_mode;	
	}
	
	//Change direction
	x_dir = dsin(90 * true_mode);
	y_dir = dcos(90 * true_mode);
}

function player_hurt(hazard_x = x)
{
	with(obj_player)
	{
		hurt_position = hazard_x;
		knockout_type = K_HURT;
	}
}