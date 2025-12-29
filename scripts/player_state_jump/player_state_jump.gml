function player_state_jump(){
	//Reset when grounded
	if(ground) {
		state = player_state_normal;
		exit;
	}
	//Change flags
	attacking = true;
	
	//Limit the jump when key is released
	if(!hold_action && y_speed < -jump_release && jump_flag)
	{
		jump_flag = false;
		y_speed = -jump_release;
	}

	//Change animation
	animation_play(animator, ANIM.ROLL);
	
	//Change animation speed
	if(character != CHAR_TAILS)
	{
		animation_set_duration(animator, jump_anim_speed);
	}	
	
	//execute shield ability
	if (press_action && character == CHAR_SONIC){
		if (instance_exists(par_shield)) {
			with (par_shield) {
				if (use_allow && shield_state == 0) {
					script_execute(jump) 
				}
			}
		}
	}
	
	//super transformation
	if (!super && allow_super && global.rings >= 50 && has_all_emeralds() && press_action && y_speed > -jump_release)
	{
		state = player_state_transform
		x_speed = 0;
		y_speed = 0;
		exit;
	}
	
	//If global value for dropdash is diabled don't execute
	if(global.use_dropdash) {
	
		//Add dropdash timer
		if(character == CHAR_SONIC)
		{
			if(press_action && dropdash_timer < 1 && y_speed > -jump_release ||
			hold_action && dropdash_timer != 0)
			{
				dropdash_timer++;
			}
		}
		//Trigger the dropdash state
		if(dropdash_timer >= 8 && state != player_state_dropdash)
		{
			play_sound(sfx_dropdash);
			state = player_state_dropdash;
			exit;
		}
	
	}
	
	//Trigger fly
	if(press_action && character == CHAR_TAILS && y_speed > -jump_release)
	{
		tails_timer = 480;
		y_accel = 0.03125;
		state = player_state_tailsfly;
		exit;
	}
	
	//Trigger the glide
	if(character == CHAR_KNUX && press_action && y_speed > -jump_release)
	{
		control_lock = 4;
		glide_speed = 4;
		knuckles_angle = 90 * facing;
		y_speed = max(y_speed, 0.5);
		state = player_state_glide;
		facing = facing;
		animation_play(animator, ANIM.KNUXGLIDE);
		exit;
	}
	
	//Trigger rolling
	if(hold_down && abs(ground_speed) > 1 && ground)
	{

		//Play the rolling animation
		animation_play(animator, ANIM.ROLL);
		
		//Update the state
		if(!landed)
		{
			state = player_state_roll;
			idle_timer = 0;
			
			//Play the sound
			play_sound(sfx_roll);
		}
		exit;
	}
}