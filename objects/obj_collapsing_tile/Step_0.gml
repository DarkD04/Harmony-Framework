/// @description Collaps it
	if(obj_player.ground && player_collide_object(C_BOTTOM)) {
		start_decay = true
	}
	
	if start_decay {
		delay--
		if delay <= -1 {
			instance_destroy()	
		}
	}