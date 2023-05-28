function player_control(){
	if(!movement_allow) exit;
	//Temp value
	var movement = obj_input.Right - obj_input.Left;
	
	//Ground movement:
	if(ground)
	{
		//Slope influence
		if(abs(ground_speed) > 0.125 || control_lock > 0) ground_speed -= 0.125*dsin(ground_angle);
		
		//Move to the left:
		if (movement = -1 && control_lock = 0)
		{
		    if (ground_speed > 0) 
		    {
		        ground_speed -= 0.5;  
		        if (ground_speed <= 0)
		            ground_speed = -0.5;  
		    }
		    else if (ground_speed > -top_speed) 
		    {
		        ground_speed -= x_accel;  
		    }
		}
	
		//Move to the right:
		if (movement = 1 && control_lock = 0)
		{
		    if (ground_speed < 0) 
		    {
		        ground_speed += 0.5; 
		        if (ground_speed >= 0)
		            ground_speed = 0.5; 
		    }
		    else if (ground_speed < top_speed) 
		    {
		        ground_speed += x_accel;
		    }
		}
		
		//Decelerate when not holding anything:
		if (movement = 0 && control_lock = 0)
		    ground_speed -= min(abs(ground_speed), friction_speed) * sign(ground_speed);
	}
	
	//Air movement
	if(!ground)
	
	{	//Handle air drag:
		if (y_speed > -4 && y_speed < 0)
		{
			x_speed -= x_speed / 32;
		}
		
		//Move to the left:
		if(x_speed >= -top_speed  && movement = -1)
			x_speed -= x_accel *2;
			
		//Move to the right:
		if(x_speed <= top_speed  && movement = 1)
			x_speed += x_accel *2;
	}
}