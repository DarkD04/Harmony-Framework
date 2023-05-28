/// @description Values
	//Get important objects
	var marker, player;
	
	marker = obj_act_trans_marker;
	player = obj_player;
	
	//Store values
	player_pos[0] = player.x - marker.x;
	player_pos[1] = player.y - marker.y;
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
		for(var i = 0; i <= bg_id; i++)
		{
			global.diff_store[i] = diff_x[i]
		}
	}
	
	//Go to the next act
	room_goto(obj_level.next_level);