/// @description Script
	//Render it behind the player
	depth = obj_player.depth + 1;
	
	//Hit the checkpoint
	if(player_collide_object(C_MAIN) && !triggered)
	{
		//Trigger the checkpoint
		triggered = true;
		
		//Store checkpoint ID
		global.checkpoint_id = id;
		
		//Store checkpoint timer
		global.time_store = global.stage_timer;
		
		//Store checkpoint ID so all checkpoints can be active during the start
		ds_list_add(global.checkpoint, id);
		
		//Play sound
		play_sound(sfx_checkpoint);
	}
	
	//Spin the checkpoint
	if(triggered)
	{
		angle = approach(angle, -720, 22.5);	
	}