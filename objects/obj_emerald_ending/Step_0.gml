if (obj_level.is_emerald_hunt) {

	if triggered {
		obj_player.input_disable = true;
		timer -= 1	
		if (timer == 40){
			fade_change(FADE_IN, 3,FADE_WHITE)
			obj_player.x_speed = 0;
			obj_player.y_speed = 0;
			obj_player.x = x
			obj_player.y = y
			obj_camera.camera_x = x
			obj_camera.camera_y = y
			obj_camera.target_x = x
			obj_camera.target_y = y
		}
		if(!instance_exists(obj_act_clear) && timer = 0) 
		{
			instance_create_depth(0, 0, 0, obj_act_clear);
		}
	}
		
	if instance_number(obj_emerald_shard) == 0 && !triggered {
		triggered = true	
		timer = 100
		obj_player.input_disable = true;
		obj_level.disable_timer = true;
		fade_change(FADE_OUT, 2,FADE_WHITE)
	}
		
		
}