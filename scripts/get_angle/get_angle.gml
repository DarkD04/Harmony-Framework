function get_angle(pos_x, pos_y, floor_mode = 0, reach_range = 16){	

	//Angle offset points value:
	var off_x, off_y;	
	
	//Depending on the floor mode move the point
	switch(floor_mode)
	{
		
		//Find floor angle:
		case 0:
			off_x[0] = floor(pos_x / 16) * 16;
			off_x[1] = floor(pos_x / 16) * 16 + 15;
			off_y[0] = floor(pos_y);
			off_y[1] = floor(pos_y);
		break;
			
		//Find right wall angle:
		case 1:
			off_x[0] = pos_x;
			off_x[1] = pos_x;
			off_y[0] = floor(pos_y / 16) * 16 + 15;
			off_y[1] = floor(pos_y / 16) * 16;
		break;
		
		//Find ceiling angle:
		case 2:
			off_x[0] = floor(pos_x / 16) * 16 + 15;
			off_x[1] = floor(pos_x / 16) * 16;
			off_y[0] = pos_y;
			off_y[1] = pos_y;
		break;
			
		//Find left wall angle:
		case 3:
			off_x[0] = pos_x;
			off_x[1] = pos_x;
			off_y[0] = floor(pos_y / 16) * 16;
			off_y[1] = floor(pos_y / 16) * 16 + 15;
		break;
	}
	
	//Move angle points
	for(var i = 0; i <= 1; i++)
	{
		off_x[i] = floor(off_x[i]);
		off_y[i] = floor(off_y[i]);
		
		switch(floor_mode)
		{
			case CMODE_FLOOR:
				while(!angle_sensor(off_x[i], off_y[i])&& off_y[i] < pos_y + reach_range)
				{
					off_y[i]++;
				}
				
				while(angle_sensor(off_x[i], off_y[i]) && off_y[i] > pos_y - reach_range)
				{
					off_y[i]--;
				}
			break;
			
			case CMODE_RWALL:
				while(!angle_sensor(off_x[i], off_y[i]) && off_x[i] < pos_x + reach_range)
				{
					off_x[i]++;
				}
				
				while(angle_sensor(off_x[i], off_y[i]) && off_x[i] > pos_x - reach_range)
				{
					off_x[i]--;
				}
			break;
			
			case CMODE_CEILING:
				while(!angle_sensor(off_x[i], off_y[i]) && off_y[i] > pos_y - reach_range)
				{
					off_y[i]--;
				}
				
				while(angle_sensor(off_x[i], off_y[i]) && off_y[i] < pos_y + reach_range)
				{
					off_y[i]++;
				}
			break;
			
			case CMODE_LWALL:
				while(!angle_sensor(off_x[i], off_y[i]) && off_x[i] > pos_x - reach_range)
				{
					off_x[i]--;
				}
				
				while(angle_sensor(off_x[i], off_y[i]) && off_x[i] < pos_x + reach_range)
				{
					off_x[i]++;
				}
			break;
		}
	}
	
	
	//Return angle
	return round(point_direction(off_x[0], off_y[0], off_x[1], off_y[1])); 

}