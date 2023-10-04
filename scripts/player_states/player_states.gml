function player_states(){	
	//Default flags:
	direction_allow = true;
	movement_allow = true;
	collision_allow = true;
	attacking = false;
	gravity_allow = true;
	ground_collision_allow = true;
	
	//Sonic states:
	player_state_peelout();
	player_state_dropdash();
	
	//Tails states:
	player_state_tailsfly();
	
	//Knuckles states:
	player_state_glide();
	player_state_wallclimb();
	player_state_ledgeclimb();
	player_state_knuxfall();
	player_state_knuxslide();
	
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
	
	//Tails object
	player_handle_tails();
}