/// @description Card events
	obj_player.input_disable = true
	
	//Remove the title card with debug
	if(!global.title_card)
	{
		instance_destroy();	
		if(!act_card)
		{
			camera_return();
		}
		else
		{
			fade_in_room(5);	
		}
		
		obj_player.input_disable = false;
		obj_level.disable_timer = false;	
		obj_hud.slide_in = true;
	}
	
	//Add title card timer
	timer++;
	
	
	
	if(timer < 100)
	{
		var curve = animcurve_get(curve_titlecard)
		var c_channel_1 = animcurve_get_channel(curve,"curve1")
		var c_channel_2 = animcurve_get_channel(curve,"curve2")
		var c_channel_3 = animcurve_get_channel(curve,"curve3")
		var c_channel_4 = animcurve_get_channel(curve,"curve4")
		
		offset[0] = animcurve_channel_evaluate(c_channel_1, min(timer / 80,1)) * global.window_width
		offset[1] = animcurve_channel_evaluate(c_channel_2, min(timer / 80,1)) * (58 + 48)
		offset[2] = animcurve_channel_evaluate(c_channel_2, min(timer / 80,1)) * 58
		offset[3] = 71 - (animcurve_channel_evaluate(c_channel_3, min(timer / 100,1)) * 71)
		offset[5] = animcurve_channel_evaluate(c_channel_1, min(timer / 80,1)) * 256
	}
	if(timer > 160)
	{
		var curve = animcurve_get(curve_titlecard_leave)
		var c_channel_1 = animcurve_get_channel(curve,"curve1")
		var c_channel_2 = animcurve_get_channel(curve,"curve2")
		var c_channel_3 = animcurve_get_channel(curve,"curve3")
		var c_channel_4 = animcurve_get_channel(curve,"curve4")
		
		offset[1] = (58 + 48) + (animcurve_channel_evaluate(c_channel_2, min((timer-160) / 40,1)) * 240)
		offset[2] = 58 + (animcurve_channel_evaluate(c_channel_2, min((timer-160) / 40,1)) * 200)
		offset[3] = (animcurve_channel_evaluate(c_channel_3, min((timer-160) / 40,1)) * 82)
		offset[5] += 20
	}
	
	//Enable flags
	if(timer > 180)
	{
		if(!act_card)
		{
			camera_return();
		}
		
		obj_player.input_disable = false;
		obj_level.disable_timer = false;	
		obj_hud.slide_in = true;
		
		//End card
		if(timer = 200) {
			offset[0] = 0
			offset[1] = 0
			offset[2] = 0
			offset[3] = 0
			offset[4] = 0
			offset[5] = 0
			offset[6] = 0
			timer = 0;
			instance_destroy();
		}
	}