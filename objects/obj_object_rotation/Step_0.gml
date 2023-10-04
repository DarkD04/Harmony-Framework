/// @description Script

	//Child object events
	for(var i = 0; i < object_amount; i++)
	{
		with(child_object[i])
		{
			//Disable culling
			if(variable_instance_exists(id, "culling")) culling = false;
			
			//Position the objects
			x = other.x + other.rot_range * dsin(other.rot_angle + (360/other.object_amount) * i);
			y = other.y + other.rot_range * dcos(other.rot_angle + (360/other.object_amount) * i);
		}
	}
	
	//Add angle and modulate
	rot_angle = (rot_angle + rot_speed) mod 360;