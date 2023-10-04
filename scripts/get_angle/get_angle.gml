function get_angle(pos_x, pos_y, floor_mode = 0){	

	//Angle offset points value:
	var off_x, off_y;	
	
	//Depending on the floor mode move the point
	switch(floor_mode)
	{
		
		//Find floor angle:
		case 0:
			off_x[0] = pos_x - pos_x mod 16;
			off_x[1] = pos_x + (15 - pos_x mod 16);
			off_y[0] = pos_y;
			off_y[1] = pos_y;
		break;
			
		//Find right wall angle:
		case 1:
			off_x[0] = pos_x;
			off_x[1] = pos_x;
			off_y[0] = pos_y + (15 - pos_y mod 16);
			off_y[1] = pos_y - pos_y mod 16;
		break;
		
		//Find ceiling angle:
		case 2:
			off_x[0] = pos_x + (15 - pos_x mod 16);
			off_x[1] = pos_x - pos_x mod 16;
			off_y[0] = pos_y;
			off_y[1] = pos_y;
		break;
			
		//Find left wall angle:
		case 3:
			off_x[0] = pos_x;
			off_x[1] = pos_x;
			off_y[0] = pos_y - pos_y mod 16;
			off_y[1] = pos_y + (15 - pos_y mod 16);
		break;
	}
	
	//Move angle points
	for(var i = 0; i <= 1; i++)
	{
		//Push angle sensors downwards
		while(!angle_sensor(off_x[i], off_y[i])
		&& off_y[i] > pos_y - 36 && off_y[i] < pos_y + 36
		&& off_x[i] > pos_x - 32 && off_x[i] < pos_x + 32)
		{
			off_x[i] += dsin(90 * floor_mode);
			off_y[i] += dcos(90 * floor_mode);
		}
		
		//Push angle sensors upwards
		while(angle_sensor(off_x[i], off_y[i]) 
		&& off_y[i] > pos_y - 36 && off_y[i] < pos_y + 36
		&& off_x[i] > pos_x - 32 && off_x[i] < pos_x + 32)
		{
			off_x[i] -= dsin(90 * floor_mode);
			off_y[i] -= dcos(90 * floor_mode);
		}
	}
	

	//Return angle
	return floor(point_direction(off_x[0], off_y[0], off_x[1], off_y[1])); 

}