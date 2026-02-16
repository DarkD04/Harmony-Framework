/// @description Collaps it

	if(obj_player.ground && player_collide_object(C_BOTTOM) && !triggered){
		triggered = true
		event_user(1) //generates tile data to be saved
		event_user(0) //collapse 
	}
	
	if (!permanent) {
		if (!on_screen(64,64) && !offscreen && triggered) {
			offscreen = true	
		}
		//refresh all tiles when reemerging on screen
		if (on_screen(64,64) && offscreen && triggered) {
			offscreen = false	
			var tilelayer = layer_tilemap_get_id(target_layer);
			for (var j = 0; j < ds_list_size(tile_memory); j++) {
				var _x = tile_memory[| j]._x
				var _y = tile_memory[| j]._y
				var _data = tile_memory[| j]._id
				tilemap_set(tilelayer, _data, _x, _y);
			}
			for (var i = 0; i < 2; i++){
				var tilelayer_c = layer_tilemap_get_id(global.col_tile[i]);
				for (var j = 0; j < ds_list_size(collision_memory[i]); j++) {
					var _x =collision_memory[i][| j]._x
					var _y = collision_memory[i][| j]._y
					var _data = collision_memory[i][| j]._id
					tilemap_set(tilelayer_c, _data, _x, _y);
				}
			}
			triggered = false	
		}
	} else {
		//double checks to clear all tiles if the collapsing platform is permanent
		if (!on_screen(64,64) && triggered && !offscreen) {
			event_user(2)
			offscreen = true
			ds_list_destroy(tile_memory)
			ds_list_destroy(collision_memory[0])
			ds_list_destroy(collision_memory[1])
		}
	}