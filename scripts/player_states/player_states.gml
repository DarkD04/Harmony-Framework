

function player_states(){	
	
	//Default flags:
	if(flag_override)
	{
		direction_allow = true;
		movement_allow = true;
		collision_allow = true;
		attacking = false;
		gravity_allow = true;
		hitbox_allow = true;
	}
	
	//State allowing flags:
	can_jump = false;
	can_roll = false;
	
	script_execute(state);	
	player_state_conditions();
	//Tails object
	player_handle_tails();
}


function player_state_conditions(){
	
	if(state == player_state_normal){
		if (ground_speed != 0 || x_speed != 0 || y_speed != 0) {
			idle_timer = 0;	
		}
	} else {
		idle_timer = 0;	
	}
	
	//Reset the timer
	if(state != player_state_jump || state == player_state_dropdash || shield != S_NONE && shield != S_NORMAL)
	{
		dropdash_timer = 0;
	}
	
	//Do the air roll
	if(press_action && !ground && global.use_airroll)
	{
		if(state == player_state_normal || state == player_state_spring)
		{
			state = player_state_jump;
			jump_flag = false;
			ceiling_lock = 2;
			jump_anim_speed = floor(max(0, 4-abs(ground_speed)));
		}
	}
	
	//Trigger look down:
	if(state == player_state_normal || state == player_state_knuxfall)
	{
		if(ground && abs(ground_speed) < 1 && mode = 0 && hold_down)
		{
			state = player_state_lookdown;
			idle_timer = 0;
		}
	}
	
	
	//Stop if not specific state
	if(state != player_state_tailsfly)
	{
		audio_stop_sound(sfx_tailsfly);
		audio_stop_sound(sfx_tailstired);
	}
	
}