/// @description End script
	
	//Stop if player doesn't exist
	if(!instance_exists(obj_player)) exit;
	
	//Show collision
	layer_set_visible("Collision", show_collision);