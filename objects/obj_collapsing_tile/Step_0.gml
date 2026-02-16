/// @description Collaps it
	if (on_screen(64,64) && !generated){
		generated = true
		event_user(1)
	}

	if(obj_player.ground && player_collide_object(C_BOTTOM) && !triggered){
		triggered = true
		event_user(0)
	}
	
	if (triggered && !on_screen(64,64) && !permanent && generated) {
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