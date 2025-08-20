	timer++
		
	if(timer < 240)
	{
		for (var i = 0; i < 64; ++i) 
		{
			var a = i % 2;
		
		    distortion_x[i] = (a ? range_x : -range_x) * dsin((360/64)*i);
		}
	
		for (var i = 0; i < 128; ++i) 
		{
		    distortion_y[i] = range_y * dcos((360/128)*i);
		}
	
	
		if(timer > 16)
		{
			ease_timer[3] = approach(ease_timer[3], 1, 0.005);
		}
	
		if(timer > 32)
		{
			dither_timer = approach(dither_timer, 1, 0.015);
			ease_timer[0] = approach(ease_timer[0], 0, 0.01);
			ease_timer[1] = approach(ease_timer[1], 0, 0.005);
		}
	
	
		scale_y = 2 * easeInOutCubic(ease_timer[0]);
		scale_y += 1;
	
		range_x = 64 * easeInOutCubic(ease_timer[0]);
		range_y = 32 * easeInOutCubic(ease_timer[1]);
		
		bar_pos = 80 * easeOutElastic(ease_timer[3]);
		bar_pos += 108;
	
		if (Input.StartPress || Input.ActionPress) && !skipped {
			fade_to_room(room_next(room), 4);
			skipped = true;
		}
		
	}
	else
	{
		fade_to_room(room_next(room), 1);
		
		ease_timer[2] = approach(ease_timer[2], 1, 0.008);
		
		scale_x = 6 * easeInQuad(ease_timer[2]);
		scale_y = 6 * easeInQuad(ease_timer[2]);
		
		scale_x += 1;	
		scale_y += 1;
		
		
	}