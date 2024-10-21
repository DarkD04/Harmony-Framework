/// @description Values
	
	//Specific values
	appear = true;
	visual_angle = 0;
	facing = 1;
	
	//Initilize animation system and recorder
	animator = new animator_create();
	player_recorder_setup();
	
	//Tails macros
	#macro TAIL_1 1
	#macro TAIL_2 2
	#macro TAIL_3 3
	
	//Animation list
	animation_add(TAIL_1, spr_tails_tail1, 0.15, 0, true, false);
	animation_add(TAIL_2, spr_tails_tail2, 0.25, 0, true, false);
	animation_add(TAIL_3, spr_tails_tail3, 0.3, 0, true, false);