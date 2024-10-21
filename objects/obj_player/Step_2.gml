/// @description End scripts
	repeat(steps)
	{
		//Stop player when hitting the walls (HAS TO BE IN END STEP)
		player_wall_stoppers();
	}
	
	//Handle player recording
	player_recorder();