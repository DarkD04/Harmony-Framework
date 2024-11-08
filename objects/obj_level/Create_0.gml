/// @description Setup

	disable_timer = false;
	badnik_chain = 0;
	
	//====================================================//
	//				 **DEFAULT STAGE SETUP**			  //
	//====================================================//
	
	//Set stage music and loop points
	stage_music = noone;
		
	//Set level name
	stage_name = "EMPTY LEVEL";
		
	//Set stage act
	act = 1;
		
	//Is next level doing act transition
	act_transition = false;
		
	//Animal array
	animal = [A_FLICKY, A_CUCKY, A_RICKY];
		
	//Next level
	next_level = room;