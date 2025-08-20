function player_state_lookup(){
	
	//If global value for peelout is diabled don't execute
	if(global.use_peelout) 
	{
		//Trigger peel out
		if(press_action && ground && character == CHAR_SONIC)
		{
			play_sound(sfx_peelout_charge);
			state = player_state_peelout
			spindash_rev = 0;
			exit;
		}
	}
	
	//Change flags
	movement_allow = false;
	direction_allow = false; 
	
	//Change animation
	animation_play(animator, ANIM.LOOKUP);
	
	//Slow crouch
	ground_speed = approach(ground_speed, 0, friction_speed);
	
	//Release
	if(!hold_up) 
	{
		state = player_state_normal;
	}
}