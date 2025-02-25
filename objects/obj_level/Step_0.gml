/// @description Script
	//Timers
	if(!disable_timer) global.stage_timer += 1000/60
	
	//Cap the stage timer
	global.stage_timer = min(global.stage_timer, 599999);
	
	//Hide collision layer
	layer_set_visible("CollisionObject", false);
	layer_set_visible(global.col_tile[0], false);
	layer_set_visible(global.col_tile[1], false);
	layer_set_visible(global.col_tile[2], false);
	layer_set_visible(global.col_tile[3], false);
	
	//Reset score combo when player lands
	if(obj_player.landed) badnik_chain = 0;
	
	//Reset act transition flag
	global.act_transition = false;
	
	//Extra life with rings
	if(global.rings >= global.ring_extralife)
	{
		global.ring_extralife += 100;
		global.life += 1;
		play_sound(j_extra_life);
	}
	if(global.rings <= global.ring_extralife-200)
	{
		global.ring_extralife -= 100;

	}
	
	//Extra life with rings
	if(global.score >= global.score_extralife)
	{
		global.score_extralife += 50000;
		global.life += 1;
		play_sound(j_extra_life);
	}
	if(global.score <= global.score_extralife-100000)
	{
		global.score_extralife -= 50000;

	}