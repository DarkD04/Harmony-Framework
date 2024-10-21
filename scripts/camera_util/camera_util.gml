function camera_set_lag(horizontal = -1, vertical = -1)
{
	//Get the camera object
	var camera = instance_find(obj_camera, 0);
	
	//Set horizontal camera lag
	if(horizontal != 1)
	{
		camera.h_lag = horizontal;
	}
	
	//Set vertical camera lag
	if(vertical != 1)
	{
		camera.v_lag = vertical;
	}
}

function camera_set_mode(camera_mode)
{
	obj_camera.mode = camera_mode;
}

function camera_return()
{
	obj_camera.mode = 1;
	obj_camera.target_x = obj_camera.camera_x;
	obj_camera.target_y = obj_camera.camera_y - 16;
	obj_camera.target_right = room_width;
	obj_camera.target_top = 0;
	obj_camera.target_bottom = room_height;
	obj_camera.limit_right = room_width;
	obj_camera.limit_top = 0;
	obj_camera.limit_bottom = room_height;	
}