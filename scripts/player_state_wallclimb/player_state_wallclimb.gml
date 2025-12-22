function player_state_wallclimb(){
	
	//Change flags
	movement_allow = false;
	direction_allow = false;
	gravity_allow = false;
	
	//Change direction
	image_xscale = facing;
	
	//Change animation
	if(y_speed != 0) 
	{
		animation_play(animator, sign(y_speed) == 1 ? ANIM.KNUXCLIMBDOWN : ANIM.KNUXCLIMBUP);
	}
	else
	{
		animation_play(animator, ANIM.KNUXCLIMBIDLE);	
	}
	
	//Get input presses
	var mov = hold_down - hold_up;
	
	//Move up and down
	y_speed = (1 + super) * mov;
	x_speed = 0;
	
	while(!point_check(wall_w * facing, wall_h, false) && point_check((wall_w + 2) * facing, wall_h, false))
	{
		x += facing;
	}
	
	while(point_check(wall_w  * facing, wall_h, false))
	{
		x -= facing;
	}
	
	//When there's no more wall
	if(!point_check((wall_w + 1) * facing, wall_h, false))
	{
		if(!check_object(wall_w + 2, hitbox_h, wall_w + 2, hitbox_h) && !point_check((wall_w + 1) * facing, -4))
		{
			//If using smooth scroll
			if(global.knux_camera_smooth)
			{
				obj_camera.mode = 2;
			}
			
			animation_set_frame(animator, 0);
			control_lock = 5;
			clamp_storex = x
			clamp_storey = y
			state = player_state_ledgeclimb;
			exit;
		}
		
		if(!point_check((wall_w + 1) * facing, 4) || check_object(wall_w + 2, hitbox_h, wall_w + 2, hitbox_h))
		{
			state = player_state_knuxfall;
			exit;
		}
	}
	
	//Jump off the wall
	if(press_action && control_lock = 0)
	{
		facing *= -1;
		x_speed = 4 * facing;
		y_speed = -4;
		state = player_state_jump;
		animation_play(animator, ANIM.ROLL);
		play_sound(sfx_jump);
		exit;
	}
	
	//Has reached the ground
	if(ground)
	{
		control_lock = 4;
		player_angle_detection()
		ground_speed = -2.5 * dsin(ground_angle)
		state = player_state_normal;
		exit;
	}
}