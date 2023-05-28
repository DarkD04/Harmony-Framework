function player_states(){	
	//Default flags:
	direction_allow = true;
	movement_allow = true;
	collision_allow = true;
	
	//Common states:
	player_state_normal();
	player_state_jump();
	player_state_spindash();
	player_state_roll();
	player_state_lookdown();
	player_state_lookup();
	player_state_spring();
	player_state_skid();
	player_state_knockout();
	
	//Sonic states:
	player_state_peelout();
}