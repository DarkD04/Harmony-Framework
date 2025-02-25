	/// @description Pause the game
	if(Input.StartPress && obj_player.input_disable = false)
	{
		global.process_objects = false;
		instance_create_depth(0, 0, -100, obj_pause);
	}