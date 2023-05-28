function get_angle(){
	//Additional script:
	angle_sensor_position();
	
	//Move angle points
	if(ground){
		for(var i = 0; i <= 1; i++)
		{
			while(!angle_sensor(point_x[i], point_y[i]) && point_x[i] < x + 32 && point_x[i] > x - 32)
			{
				point_x[i] += x_dir;
				point_y[i] += y_dir;
			}
		}
	}
	if(ceiling_landing > 0)
	{
		for(var i = 0; i <= 1; i++)
		while(!angle_sensor(point_x[i], point_y[i])) point_y[i] -= 1;
	}
	
	//Return angle
	return point_direction(point_x[0], point_y[0], point_x[1], point_y[1]); 

}