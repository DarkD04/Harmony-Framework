function player_mode(){
	//Change angle modes
	if(ground_angle >= 0 && ground_angle <= 45 || ground_angle >= 315 && ground_angle <= 360) mode = 0;
	if(ground_angle >= 46 && ground_angle <= 134) mode = 1;
	if(ground_angle >= 135 && ground_angle <= 225) mode = 2;
	if(ground_angle >= 226 && ground_angle <= 314) mode = 3;
	
	//Change direction
	switch(mode)
	{
		case 0: x_dir = 0; y_dir = 1; break;	
		case 1: x_dir = 1; y_dir = 0; break;
		case 2: x_dir = 0; y_dir = -1; break;	
		case 3: x_dir = -1; y_dir = 0; break;	
	}
}