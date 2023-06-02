function player_state_tailsfly(){
	//Trigger fly
	if(state = ST_JUMP && Input.ActionPress && character = CHAR_TAILS)
	{
		tails_timer = 480;
		y_accel = 0.03125;
		state = ST_TAILSFLY;	
	}
	
	//Stop if not specific state
	if(state != ST_TAILSFLY)
	{
		audio_stop_sound(sfx_tailsfly);
		audio_stop_sound(sfx_tailstired);
		exit;
	}
	
	//Animation
	animation = ANIM_TAILSFLY;
	
	//Speed cap
	y_speed = max(y_speed , -4);
	
	//Changing gravity depending on the action
	if(Input.ActionPress && tails_timer != 0) y_accel = -0.125;
	if(y_speed <= -1 || touching_ceiling || tails_timer = 0) y_accel = 0.03125;
	
	//Subtract timer
	tails_timer--;
	tails_timer = max(tails_timer, 0);
	
	//Reset the state when player is grounded
	if(ground) state = ST_NORMAL;
	
	//Tired tails
	if(tails_timer = 0)
	{
		animation = ANIM_TAILSTIRED;
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
	}else
	{
		audio_stop_sound(sfx_tailsfly);
		audio_stop_sound(sfx_tailstired);
	}
	//Weird gravity fix
	if(tails_timer = 480-1) y_accel = 0.03125;
}