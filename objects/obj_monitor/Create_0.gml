/// @description Values
	destroyed = false;
	ground = true;
	y_speed = 0;
	monitor_icon = spr_monitor_icon_10ring;
	culling = true;
	
	if (!instance_exists(obj_bonus_level)) {
		if (global.store_object_state[| id]) {
			destroyed = true
			ground = false
		}
	}