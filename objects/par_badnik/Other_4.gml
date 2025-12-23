if (!instance_exists(obj_bonus_level)) {
	if (global.store_object_state[| id]) {
		instance_destroy()	
	}
}
