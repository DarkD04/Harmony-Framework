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
	
	
	
	if(timer < 90)
	{
		var curve = animcurve_get(curve_titlecard_bonus)
		var c_channel_1 = animcurve_get_channel(curve,"curve1")
		var c_channel_2 = animcurve_get_channel(curve,"curve2")
		var c_channel_3 = animcurve_get_channel(curve,"curve3")
		var c_channel_4 = animcurve_get_channel(curve,"curve4")
		
		offset[0] = (animcurve_channel_evaluate(c_channel_2, min(timer / 80,1)) * WINDOW_WIDTH)
		offset[1] = (animcurve_channel_evaluate(c_channel_2, min(timer / 80,1)) * (WINDOW_HEIGHT / 2)) - 32
		offset[2] = (animcurve_channel_evaluate(c_channel_3, min(timer / 80,1)) * ((WINDOW_HEIGHT / 2) + 16)) - 16
		offset[5] = animcurve_channel_evaluate(c_channel_1, min(timer / 80,1)) * 512
	}
	if(timer > 90)
	{
		var curve = animcurve_get(curve_titlecard_leave)
		var c_channel_1 = animcurve_get_channel(curve,"curve1")
		var c_channel_2 = animcurve_get_channel(curve,"curve2")
		var c_channel_3 = animcurve_get_channel(curve,"curve3")
		var c_channel_4 = animcurve_get_channel(curve,"curve4")
		
		offset[1] = ((WINDOW_HEIGHT / 2) - 32) + (animcurve_channel_evaluate(c_channel_2, min((timer-90) / 40,1)) * 240)
		offset[3] = (animcurve_channel_evaluate(c_channel_2, min((timer-90) / 40,1)) * (WINDOW_WIDTH *2))
	}
	
	//freeze player while running titlecard
	if(timer <= 130)
	{
		obj_player.visible = false
		if (instance_exists(par_shield)) {
			par_shield.visible = false
		}
		obj_player.x_speed = 0
		obj_player.y_speed = 0
		obj_player.y = obj_player.ystart
		obj_player.state = player_state_spring
	}
	//launch player up
	if (timer = 130) {
		obj_player.visible = true
		if (instance_exists(par_shield)) {
			par_shield.visible = true
		}
		obj_player.x_speed = 0
		obj_player.y_speed = -10
	}
	
	//Enable flags
	if(timer > 130)
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