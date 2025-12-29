	/// @description Pause the game
	if(Input.StartPress && obj_player.input_disable = false  && !instance_exists(obj_pause))
	{
		global.process_objects = false;
		instance_create_depth(0, 0, -100, obj_pause);
	}
	
	if (!scattered_emerald_shards && is_emerald_hunt) {
		var spots_array = array_create(instance_number(obj_emerald_locations))
		var i = 0;
		repeat(instance_number(obj_emerald_locations)){
			spots_array[i] = instance_find(obj_emerald_locations,i)
			i++;
		}
		repeat(emerald_hunt_randoms) {
			var pick = irandom_range(0,array_length(spots_array)-1)
			var obj = spots_array[pick]
			instance_create_depth(obj.x,obj.y,depth,obj_emerald_shard)
			array_delete(spots_array,pick,1);
		}
		scattered_emerald_shards = true;
	}
	
	for(var j=0; j<array_length(emerald_array); j++) {
		emerald_array[j] = max(emerald_array[j] -1,0)
	}

