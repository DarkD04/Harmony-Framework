function player_state_jump(){
	//Trigger jump
	if(state == ST_NORMAL || state == ST_ROLL || state == ST_SKID)
	{
		if(press_action && ground && !touching_ceiling && !force_roll){
			y_speed -= jump_strenght*dcos(ground_angle);	
			x_speed -= jump_strenght*dsin(ground_angle);	
			jump_flag = true;
			ground = false;
			state = ST_JUMP
			jump_anim_speed = floor(max(0, 4-abs(ground_speed)));
			play_sound(sfx_jump);
		}
	}
	
	//Do the air roll
	if(press_action && !ground && global.use_airroll)
	{
		if(state == ST_NORMAL || state == ST_SPRING)
		{
			state = ST_JUMP;
			jump_flag = false;
			ceiling_lock = 2;
			jump_anim_speed = floor(max(0, 4-abs(ground_speed)));
		}
	}
	
	//Stop if its not jump state
	if(state != ST_JUMP) exit;
	
	//Change flags
	attacking = true;
	//Limit the jump when key is released
	if(!hold_action && y_speed < -4 / (1 + underwater) && jump_flag)
	{
		jump_flag = false;
		y_speed = -4 / (1 + underwater);
	}

	//Change animation
	animation = ANIM_ROLL;
	
	//Change animation speed
	if(character != CHAR_TAILS)animation_set_speed = jump_anim_speed;
	
	//Reset when grounded
	if(ground) state = ST_NORMAL;
}