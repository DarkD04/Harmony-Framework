function player_state_glide(){
	//Trigger the glide
	if(state = ST_JUMP && Input.ActionPress)
	{
		control_lock = 4;
		glide_speed = 4;
		knuckles_angle = 90 * facing;
		y_speed = max(y_speed, 0.5);
		state = ST_KNUXGLIDE;
	}
	
	//If not gliding then stop
	if(state != ST_KNUXGLIDE) exit;
	
	//Change animation
	if(animation != ANIM_KNUXGLIDETURN) animation = ANIM_KNUXGLIDE else image_xscale = 1;
	
	//Change flags
	movement_allow = false;
	direction_allow = false;
	gravity_allow = false;
	attacking = true;

	//Adjust y speed
	if(y_speed < 0.5) y_speed += 0.125;
	if(y_speed > 0.5) y_speed -= 0.125;
	
	//Force x speed to glide speed
	x_speed = glide_speed * dsin(knuckles_angle);
	
	//Accelerate
	if(knuckles_angle = 90 || knuckles_angle = -90)glide_speed += 0.015625;
	
	//Limit the glide speed
	glide_speed = clamp(glide_speed, -24, 24);
	
	//Get input
	var mov = Input.Right - Input.Left;
	
	//Glide turn animation
	if(mov = -1 && facing = 1 || mov = 1 && facing = -1)
	{
		animation = ANIM_KNUXGLIDETURN;
	}
	
	//Turn glide
	if(mov != 0) facing = mov;
	
	//Adjust angle
	knuckles_angle = approach(knuckles_angle, 90 * facing, 2.8125);
	
	//glide turning
	if(animation = ANIM_KNUXGLIDETURN)
	{
		animation_frame = knux_frame;	
		knux_frame = clamp(knux_frame - animation_speed * facing, 0, sprite_get_number(spr_knuckles_turn)-1);
		
		//Switch back animation
		if(knux_frame <= 0.5 && facing = 1 || knux_frame >= sprite_get_number(spr_knuckles_turn)-1 && facing = -1)
		{
			animation = ANIM_KNUXGLIDE;
			image_xscale = facing
		}
	}else
	{
		image_xscale = facing
		if(facing = 1)knux_frame = 0; else knux_frame = sprite_get_number(spr_knuckles_turn)-1;	
	}
	
	//Attach to the wall
	if(point_check((wall_w + 1) * facing, 0, false))
	{
		state = ST_KNUXCLIMB;
	}
	
	//Get grounded
	if(ground && ground_angle > 45 && ground_angle < 315)
	{
		state = ST_NORMAL;
		control_lock = 4;
	}
	
}