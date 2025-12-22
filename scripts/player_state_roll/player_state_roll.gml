function player_state_roll(){
	
	//Change animation and speed
	animation_play(animator, ANIM.ROLL);
	if(ground && character != CHAR_TAILS)
	{
		animation_set_duration(animator, floor(max(0, 4-abs(ground_speed))));
	}
	
	//Change flags
	attacking = true;
	
	//Change on ground flag
	if(ground)
	{
		movement_allow = false;
	}
	
	//Rolling physics
	if(sign(ground_speed) = sign(dsin(ground_angle))) 
	{
		ground_speed -= roll_influence_up * dsin(ground_angle);
	}
	else 
	{
		ground_speed -= roll_influence_down * dsin(ground_angle);
	}
	
	//Rolling driction
	ground_speed = approach(ground_speed, 0, roll_friction);
	
	//Trigger jump
	if(press_action && ground && !touching_ceiling && !force_roll)
	{
		//Change animation
		animation_play(animator, ANIM.ROLL);
		
		//Jump off the terrain
		y_speed -= jump_strength * dcos(ground_angle);	
		x_speed -= jump_strength * dsin(ground_angle);
			
		//Trigger the jump flag
		jump_flag = true;
			
		//Detach player off the ground and change state
		ground = false;
		state = player_state_jump
		dropdash_timer = 0;
		idle_timer = 0;
		//Change jump animation duration
		jump_anim_speed = floor(max(0, 4-abs(ground_speed)));
			
		//Reset angle and floor mode
		ground_angle = 0;
		player_reposition_mode(CMODE_FLOOR);
			
		//Play the sound
		play_sound(sfx_jump);
		exit;
	}
	
	//Stop rolling
	if(ground_angle < 40 || ground_angle > 320)
	{
		if(ground_speed == 0 && !force_roll && ground) 
		{
			state = player_state_normal;
			exit;
		}
	}
	
	//Reset state back to normal when landing
	if(landed) 
	{
		state = player_state_normal;
		exit;
	}
	
	//Get input
	var mov = hold_right - hold_left;
	
	//Turning to different direction
	if(mov = -sign(ground_speed) && !force_roll) 
	{
		ground_speed -= 0.125 * -mov;	
	}
	
	//Force roll push
	if(abs(ground_speed) < 0.5 && force_roll)
	{
		if(ground_angle < 20 || ground_angle > 360 - 20)
		{
			ground_speed = 2 * facing;
		}
	}
	
	//Rolling speed cap
	ground_speed = clamp(ground_speed, -roll_speed_cap, roll_speed_cap);
}