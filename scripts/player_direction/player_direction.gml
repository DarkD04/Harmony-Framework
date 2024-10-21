function player_direction(){
	//Get input difference:
	var input_press = hold_right - hold_left;
	
	if(direction_allow)
	{
		//On ground direction:
		if(ground)
		{
			//Change direction depending on the ground speed:
			if(input_press != 0 && sign(ground_speed) = input_press && control_lock = 0) facing = sign(input_press);
		}else
		//Airborn events:
		{
			//Change direction depending on input press:
			if(input_press != 0) facing = input_press;
		}
	}
	
	//Change image scale
	image_xscale = facing;
}