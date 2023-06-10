/// @description Script
	//Timers
	global.object_timer += 1;
	if(!disable_timer) global.stage_timer += 1000/60
	
	//Hide collision layer
	layer_set_visible("Collision", false);
	
	//Reset score combo when player lands
	if(obj_player.landed) badnik_chain = 0;
	
	//Reset act transition flag
	global.act_transition = false;