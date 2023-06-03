/// @description Script

	//Collision region code
	var _list = ds_list_create();
	var _num = collision_rectangle_list(start_left, y, start_right, bbox_bottom, par_solid, true, true, _list, false);
	
	//Collision change code
	    for (var i = 0; i < _num; ++i;)
	    {
			var solids = _list[| i]
			if(facing = 1)
			{
		        if(obj_player.x + obj_player.wall_w > bbox_right)
				{
					solids.collision_flag = false;
				}else
				{
					solids.collision_flag = true;
				}
				if(bbox_right < _list[| i].bbox_left) instance_destroy(_list[| i])
			}else
			{
				if(obj_player.x - obj_player.wall_w < bbox_left)
				{
					solids.collision_flag = false;
				}else
				{
					solids.collision_flag = true;
				}
				if(bbox_left > _list[| i].bbox_right) instance_destroy(_list[| i])
			}
		}
	    
	ds_list_destroy(_list);
	
	//Stop executing
	if(table_position >= array_length(timer_end)) exit;
	
	//Add timer
	timer++;
	
	//Repeat and subtract collision size
	if(timer >= timer_end[table_position])
	{
		//timer = timer_end[table_position];
		table_position +=1;
		if(facing = 1)
		{
			image_xscale -= 1;
		}else{
			x += 16;
			image_xscale -= 1;
		}
	}	