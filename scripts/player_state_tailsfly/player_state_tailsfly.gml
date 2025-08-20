function player_state_tailsfly(){
	
	//Speed cap
	y_speed = max(y_speed , -4);
	
	//Changing gravity depending on the action
	if(press_action && tails_timer != 0) y_accel = -0.125;
	if(y_speed <= -1 || touching_ceiling || tails_timer == 0) y_accel = 0.03125;
	
	//Subtract timer
	tails_timer--;
	tails_timer = max(tails_timer, 0);
	
	//Reset the state when player is grounded
	if(ground) 
	{
		state = player_state_normal;
		exit;
	}
	
	//Tired tails
	if(tails_timer == 0)
	{
		animation_play(animator, underwater ? ANIM.TAILSSWIMTIRED : ANIM.TAILSTIRED);
	}
	else
	{
		animation_play(animator, underwater ? ANIM.TAILSSWIM : ANIM.TAILSFLY);
	}
	
	//Play sound
	if(!underwater)
	{
		if(!audio_is_playing(sfx_tailsfly) && tails_timer != 0)
		{
			play_sound(sfx_tailsfly, true);
			audio_stop_sound(sfx_tailstired);
		}
		if(!audio_is_playing(sfx_tailstired) && tails_timer = 0)
		{
			play_sound(sfx_tailstired, true);
			audio_stop_sound(sfx_tailsfly);
		}
	}
	else
	{
		audio_stop_sound(sfx_tailsfly);
		audio_stop_sound(sfx_tailstired);
	}
	
	//Weird gravity fix
	if(tails_timer == 480-1) 
	{
		y_accel = 0.03125;
	}
}