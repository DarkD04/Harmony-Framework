function player_state_wallclimb(){
	//If state is not wall climb don't execute
	if(state != ST_KNUXCLIMB) exit;
	
	//Change flags
	movement_allow = false;
	direction_allow = false;
	gravity_allow = false;
	
	//Change direction
	image_xscale = facing;
	
	//Change animation
	animation = ANIM_KNUXCLIMB;
	
	//Standing still
	if(y_speed == 0) animation = ANIM_KNUXCLIMBIDLE;
	
	//Get input presses
	var mov = hold_down - hold_up;
	
	//Move up and down
	y_speed = 1 * mov;
	x_speed = 0;
	
	//When there's no more wall
	if(!point_check((wall_w + 1) * facing, wall_h, false))
	{
		if(hold_up && !hold_down && !check_object(wall_w + 2, hitbox_h, wall_w + 2, hitbox_h) && !line_check(wall_w * facing, -hitbox_h - 16))
		{
			if(obj_camera.smooth_knux_cam)obj_camera.mode = 2;
			control_lock = 5;
			clamp_storex = x
			clamp_storey = y
			state = ST_KNUXLEDGE;
		}
		
		if(!hold_up && hold_down || check_object(wall_w + 2, hitbox_h, wall_w + 2, hitbox_h))
		{
			state = ST_KNUXFALL;
		}
	}
	
	//Jump off the wall
	if(press_action && control_lock = 0)
	{
		facing *= -1;
		x_speed = 4 * facing;
		y_speed = -4;
		state = ST_JUMP;
		play_sound(sfx_jump);
	}
	
	//Has reached the ground
	if(ground)
	{
		control_lock = 4;
		player_angle_detection()
		ground_speed = -2.5 * dsin(ground_angle)
		state = ST_NORMAL;
	}
}