function player_debug(){
	//Trigger debug	
	x += x_speed;
	y += y_speed;
	collision_allow = false;
	ground = false;
		
	var mov_x = Input.Right - Input.Left;
	var mov_y = Input.Down - Input.Up;
		
	if(mov_x != 0) x_speed += 0.1*mov_x;
	if(mov_y != 0) y_speed += 0.1*mov_y;
		
	if(mov_x = 1 && x_speed < 0 || mov_x = -1 && x_speed > 0) x_speed += 0.2 * mov_x;
	if(mov_y = 1 && y_speed < 0 || mov_y = -1 && y_speed > 0) y_speed += 0.2 * mov_y;
	if(mov_x = 0) x_speed -= min(abs(x_speed), 0.1) * sign(x_speed); 
	if(mov_y = 0) y_speed -= min(abs(y_speed), 0.1) * sign(y_speed);
		
	if(mov_x != 0) facing = mov_x;
	
}