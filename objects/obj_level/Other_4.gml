/// @description Stage start
	//Play stage music
	play_music(stage_music, BGM, loop_start, loop_end, true);
	
	//Position player to the checkpoint
	if(global.checkpoint_id != noone)
	{
		obj_player.x = global.checkpoint_id.x;
		obj_player.y = global.checkpoint_id.bbox_bottom - obj_player.hitbox_h;
		global.stage_timer = global.time_store;
	}