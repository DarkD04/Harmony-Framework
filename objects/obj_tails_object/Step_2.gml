/// @description Script
	//Tails macros
	#macro TAIL_1 1
	#macro TAIL_2 2
	#macro TAIL_3 3
	
		//Animation list
	add_animation(TAIL_1, spr_tails_tail1, 0.15, 0, true, false);
	add_animation(TAIL_2, spr_tails_tail2, 0.25, 0, true, false);
	add_animation(TAIL_3, spr_tails_tail3, 0.3, 0, true, false);
	
	//Animation system
	animation_system();
	
	//Recording system
	player_recorder();
	
	//Change tail direction
	image_xscale = facing;