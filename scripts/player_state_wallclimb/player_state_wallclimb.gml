function player_state_wallclimb(){
	//If state is not wall climb don't execute
	if(state != ST_KNUXCLIMB) exit;
	
	//Change flags
	movement_allow = false;
	direction_allow = false;
	gravity_allow = false;

	
	//Change animation
	animation = ANIM_KNUXCLIMB;
	
	//Get input presses
	var mov = Input.Down - Input.Up;
	
	//Move up and down
	y_speed = 1 * mov;
	
	//When there's no more wall
	if(!point_check((wall_w + 1) * facing, wall_h, false))
	{
		//CHOPP PLEASEEEEE
		control_lock = 5;
		//store last position 
		clamp_storex = x
		clamp_storey = y
		state = ST_KNUXLEDGE;
		//This really depends on how you handle your animation, you must modify this yourself
		///Remove this if not needed
		//while(!line_check(wall_w, hitbox_h, true)) y += 1;
		//while(line_check(wall_w, hitbox_h, true)) y -= 1;
	}
	
	//Jump off the wall
	if(Input.ActionPress && control_lock = 0)
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