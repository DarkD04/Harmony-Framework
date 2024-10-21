function player_debug(){
	//Trigger debug	
	x += x_speed;
	y += y_speed;
	
	//Update flags
	collision_allow = false;
	hitbox_allow = false;
	ground = false;
	
	//Default movement speed
	var speedmode = 1 + keyboard_check(vk_shift);
	
	//Input presses
	var mov_x = hold_right - hold_left;
	var mov_y = hold_down - hold_up;
	
	//Horizontal acceleration
	if(mov_x != 0) 
	{
		x_speed += 0.1 * mov_x * speedmode;
	}
	
	//Vertical acceleration
	if(mov_y != 0) 
	{
		y_speed += 0.1 * mov_y * speedmode;
	}
	
	//Horizontal deceleration
	if(mov_x = 1 && x_speed < 0 || mov_x = -1 && x_speed > 0) 
	{
		x_speed += 2 * mov_x;
	}
	
	//Vertical deceleration
	if(mov_y = 1 && y_speed < 0 || mov_y = -1 && y_speed > 0)
	{
		y_speed += 2 * mov_y;
	}
	
	//Horizontal friction when not holding any inputs
	if(mov_x = 0) 
	{
		x_speed -= min(abs(x_speed), 0.1) * sign(x_speed); 
	}
	
	//Vertical friction when not holding any inputs
	if(mov_y = 0) 
	{
		y_speed -= min(abs(y_speed), 0.1) * sign(y_speed);
	}
		
	
	//Become alive again
	if(state == ST_KNOCKOUT && knockout_type == K_DIE || state == ST_KNOCKOUT && knockout_type == K_DROWN)
	{
		state = ST_NORMAL;
		knockout_type = 0;
		death_timer = 0;
		obj_camera.mode = CAM_RETURN;
		depth = start_depth;
	}
	
}