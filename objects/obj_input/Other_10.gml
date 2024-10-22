	/// @description Analog axis presses
	
	//Right analog press
	if (gamepad_axis_value(global.gamepad_slot, gp_axislh) >= deadzone_x)
	{
		//Hold the key
		Right = true;
			
		//Press the key
		if(!axis_right_press)
		{
			RightPress = true;
			axis_right_press = true;
		}
	}
	else
	{
		axis_right_press = false;	
	}
	
	//Right analog press
	if (gamepad_axis_value(global.gamepad_slot, gp_axislh) <= -deadzone_x)
	{
		//Hold the key
		Left = true;
			
		//Press the key
		if(!axis_left_press)
		{
			LeftPress = true;
			axis_left_press = true;
		}
	}
	else
	{
		axis_left_press = false;	
	}
	
	//Annoying tolerance fix
	if(!axis_left_press && !axis_right_press)
	{
		//Down analog press
		if (gamepad_axis_value(global.gamepad_slot, gp_axislv) >= deadzone_y)
		{
			//Hold the key
			Down = true;
			
			//Press the key
			if(!axis_down_press)
			{
				DownPress = true;
				axis_down_press = true;
			}
		}
		else
		{
			axis_down_press = false;	
		}
	
		//Up analog press
		if (gamepad_axis_value(global.gamepad_slot, gp_axislv) <= -deadzone_y)
		{
			//Hold the key
			Up = true;
			
			//Press the key
			if(!axis_up_press)
			{
				UpPress = true;
				axis_up_press = true;
			}
		}
		else
		{
			axis_up_press = false;	
		}
	}