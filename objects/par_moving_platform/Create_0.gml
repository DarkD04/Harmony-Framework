/// @description Values
	sink_offset = 0;
	move_object = [obj_ring, obj_spring_vertical, obj_monitor, par_moving_platform, par_badnik];
	origin_x = xstart
	origin_y = ystart
	
	attached_list = ds_list_create();
	
	if object_range > 0 {
		show_debug_message(move_object)
		for(var i = 0; i < array_length(move_object); i++)
		{
			var _num = collision_rectangle_list(bbox_left , bbox_top - object_range, bbox_right, y, move_object[i], false, true, attached_list, true)
			show_debug_message(_num)
			if (_num > 0)
			{
			    for (var j = 0; j < _num; ++j;)
			    {
			        attached_list[| j].attached = true
					show_debug_message(object_get_name( attached_list[| j].object_index))
			    }
			}
		}
	}