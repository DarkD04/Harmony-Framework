function player_state_roll(){
	//List of states that allow for jumping
	var can_roll_states = [ST_NORMAL, ST_JUMP, ST_LOOKDOWN, ST_SKID];
	
	//Run the loop on array
	for (var i = 0; i < array_length(can_roll_states); ++i) 
	{
		//If states match the ones on the list, allow for jumping
	    if(state == can_roll_states[i])
		{
			can_roll = true;
		}
	}
	
	//Trigger rolling
	if(can_roll && hold_down && abs(ground_speed) > 1 && ground)
	{

		//Play the rolling animation
		animation_play(animator, ANIM_ROLL);
		
		//Update the state
		if(!landed)
		{
			state = ST_ROLL;
			
			//Play the sound
			play_sound(sfx_roll);
		}
	}
	
	//Stop executing if not rolling
	if(state != ST_ROLL) 
	{
		exit;
	}
	
	//Change animation and speed
	animation_play(animator, ANIM_ROLL);
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
	ground_speed = approach(ground_speed, 0, 0.046875 / 2);
				
	//Stop rolling
	if(ground_angle < 40 || ground_angle > 320)
	{
		if(ground_speed == 0 && !force_roll && ground) 
		{
			state = ST_NORMAL;
		}
	}
	
	//Reset state back to normal when landing
	if(landed) 
	{
		state = ST_NORMAL;
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