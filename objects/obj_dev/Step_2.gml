/// @description End script
	
	//Stop if player doesn't exist
	if(!instance_exists(obj_player)) exit;
	
	//Show collision
	layer_set_visible("CollisionObject", show_collision);
	layer_set_visible("Triggers", show_collision);
	layer_set_visible(global.col_tile[0], show_collision);
	layer_set_visible(global.col_tile[1], show_collision);
	layer_set_visible(global.col_tile[2], obj_player.plane == 0 ? show_collision : false);
	layer_set_visible(global.col_tile[3], obj_player.plane == 1 ? show_collision : false);
	
	