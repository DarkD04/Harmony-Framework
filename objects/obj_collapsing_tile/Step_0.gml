/// @description Collaps it
	if(obj_player.ground && player_collide_object(C_BOTTOM) && !triggered){
		triggered = true
		event_user(0)
	}
	
	if (triggered && !on_screen(32,32) && !permanent) {
		var tilelayer = layer_tilemap_get_id(target_layer);
		while(ds_list_size(tile_memory)) {
			var _x = tile_memory[| 0]._x
			var _y = tile_memory[| 0]._y
			var _data = tile_memory[| 0]._id
			tilemap_set_at_pixel(tilelayer, _data, _x, _y);
			ds_list_delete(tile_memory,0)
		}
		var i = 0
		repeat(2) {
			tilelayer = layer_tilemap_get_id(global.col_tile[i]);
			while(ds_list_size(collision_memory[i])) {
				var _x =collision_memory[i][| 0]._x
				var _y = collision_memory[i][| 0]._y
				var _data = collision_memory[i][| 0]._id
				tilemap_set_at_pixel(tilelayer, _data, _x, _y);
				ds_list_delete(collision_memory[i],0)
			}
			i++
		}
		
		
		
		triggered = false	
	}