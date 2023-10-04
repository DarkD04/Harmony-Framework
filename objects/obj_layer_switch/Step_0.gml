/// @description Collision Test
	if (player_collide_object(C_MAIN))
	{
		switch(layer_type)
		{
			case "Layer A":
				obj_player.plane = 0;
			break;
			
			case "Layer B":
				obj_player.plane = 1;
			break;
			
			case "From A to B":
			if(obj_player.ground_speed > 0) obj_player.plane = 1; else obj_player.plane = 0;
			break;
			
			case "From B to A":
			if(obj_player.ground_speed > 0) obj_player.plane = 0; else obj_player.plane = 1;
			break;
		}
	}
	
	if(!on_screen()) instance_deactivate_object(id);