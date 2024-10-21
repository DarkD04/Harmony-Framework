/// @description Values

	//Get important objects
	var marker, player;
	
	marker = obj_act_trans_marker;
	player = obj_player;
	
	//Store values
	player_pos[0] = player.x - marker.x;
	player_pos[1] = player.y - marker.y;
	shield_store = player.shield;
	camera_pos[0] = obj_camera.camera_x - marker.x;
	camera_pos[1] = obj_camera.camera_y - marker.y;
	cam_bound[0] = obj_camera.limit_left - marker.x;
	cam_bound[1] = obj_camera.limit_right - marker.x;
	cam_bound[2] = obj_camera.limit_top - marker.y;
	cam_bound[3] = obj_camera.limit_bottom - marker.y;
	sign_pos[0] = obj_signpost.x - marker.x;
	sign_pos[1] = obj_signpost.y - marker.y;
	
	//Storing background oh no
	with(par_background)
	{
		for(var i = 0; i < bg_id; i++)
		{
			global.diff_store_x[i] = diff_x[i]
			global.diff_store_y[i] = diff_y[i]
		}
	}
	
	//Store monitors
	monitor_len = array_length(global.monitor_store);
	
	for (var i = 0; i < monitor_len; ++i) 
	{
		if(instance_exists(global.monitor_store[i]))
		{
		    monitor_x[i] = global.monitor_store[i].x - marker.x;
			monitor_y[i] = global.monitor_store[i].y - marker.y;
			monitor_type[i] = global.monitor_store[i].monitor_type;
			monitor_destroy[i] = global.monitor_store[i].destroyed;
			monitor_depth[i] = global.monitor_store[i].depth;
		}
		else
		{
			monitor_destroy[i] = true;	
		}
	}
	
	//Change flag if act transition
	global.act_transition = true;
	
	//Go to the next act
	reset_stage_data();
	room_goto(obj_level.next_level);