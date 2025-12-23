/// @description Setup

	disable_timer = false;
	badnik_chain = 0;
	scattered_emerald_shards = false
	emerald_array = []
	
	//====================================================//
	//				 **DEFAULT STAGE SETUP**			  //
	//====================================================//
	
	//Set stage music and loop points
	stage_music = noone;
	loop_start = 0.00;
	loop_end = 0.00;
		
	//Set level name
	stage_name = "Empty Level";
		
	//Set stage act
	act = 1;
	is_emerald_hunt = false;
	emerald_hunt_randoms = 3;
	emerald_hunt_total = 0;
		
	//Is next level doing act transition
	act_transition = false;
		
	//Animal array
	animal = [A_FLICKY, A_CUCKY, A_RICKY];
		
	//Next level
	next_level = room;
	
	//Setup red rings
	red_ring_count = 0