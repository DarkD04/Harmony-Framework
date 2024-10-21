/// @description Stage start
	//Play stage music
	play_music(stage_music, 0);
	
	//Reset stage data
	global.stage_timer = 0;
	global.rings = 0;
	
	//Position player to the checkpoint
	if(global.checkpoint_id != noone)
	{
		obj_player.x = global.checkpoint_id.x;
		obj_player.y = global.checkpoint_id.bbox_bottom - obj_player.hitbox_h;
		obj_camera.target_x = obj_player.x;
		obj_camera.target_y = obj_player.y-16;
		global.stage_timer = global.time_store;
	}
	
