function dust_effect(type = 0){

	var obj, size_x, size_y;
	
	size_x = sprite_width;
	size_y = sprite_height;
	
	for(var i = 0; i < size_x; i++)
	{
		for(var j = 0; j < size_y; j++)
		{
			obj = instance_create_depth(bbox_left + i, bbox_top + j, depth, obj_dust_effect);
			obj.sprite_index = sprite_index;
			obj.frm = image_index;
			obj.type = type;
			obj.w = i;
			obj.h = j;
			obj.x_speed = ( random_range(0.5, 3) * dsin(random_range( - 35, 35 )) ) / 1.5
			obj.y_speed = ( random_range(0.5, 3) * dcos(random_range( - 80, 80 )) ) / 1.5
			if(type = 0)
			obj.timer_end = 4+random(16);
			if(type = 1)
			{
				obj.time = 3 * j;
				obj.timer_end = 32;
			}
		}
	}
	instance_destroy();
	
}