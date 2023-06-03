function player_state_glide(){
	//Trigger the glide
	if(state = ST_JUMP && Input.ActionPress)
	{
		glide_speed = 4;
		knuckles_angle = 90 * facing;
		y_speed = max(y_speed, 0.5);
		state = ST_KNUXGLIDE;
	}
	
	//If not gliding then stop
	if(state != ST_KNUXGLIDE) exit;
	
	//Change animation
	if(animation != ANIM_KNUXGLIDETURN)animation = ANIM_KNUXGLIDE;
	
	//Change flags
	movement_allow = false;
	direction_allow = false;
	
	//Adjust y speed
	if(y_speed < 0.5) y_speed += 0.125;
	if(y_speed > 0.5) y_speed -= 0.125;
	
	//Force x speed to glide speed
	x_speed = glide_speed * dsin(knuckles_angle);
	
	//Turn glide
	var mov = Input.Right - Input.Left;
	if(mov != 0) facing = mov;
	
	//Adjust angle
	knuckles_angle = approach(knuckles_angle, 90 * facing, 2.8125);
	
	//Glide turn animation
	if(Input.LeftPress || Input.RightPress)
	{
		animation = ANIM_KNUXGLIDETURN;
	}
	
	if(animation = ANIM_KNUXGLIDETURN)
	{
		image_xscale = 1;
		animation_frame = knux_frame;	
		knux_frame = clamp(knux_frame - animation_speed * facing, 0, image_number)
	}
	
	//Change direction
	if(animation != ANIM_KNUXGLIDETURN) image_xscale = facing;
}