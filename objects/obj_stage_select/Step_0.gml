	//Get input
	var press_x = Input.RightPress - Input.LeftPress;
	var press_y = Input.DownPress - Input.UpPress;
	
	//Get zone array size
	var zone_arr = array_length(zone_list);
	
	//Noises
	if(press_x != 0 || press_y != 0) play_sound(sfx_beep);
	
	//Select zones
	zone_sel += press_y;
	
	//Mod
	zone_sel %= zone_arr+1;
		
	//Warp
	if(zone_sel < 0) zone_sel = zone_arr;
		
	//Select acts
	if(zone_sel != zone_arr && zone_sel != -1)
	{
		act_sel += press_x;
		
		//Mod
		act_sel %= array_length(zone_list[zone_sel]) -1;
		
		//Warp
		if(act_sel < 0) act_sel = array_length(zone_list[zone_sel]);
		
		//Temp
		var a, b;
		a = min(zone_sel, zone_arr);
		b = min(act_sel, array_length(zone_list[zone_sel])- 1);
		
		//Enter the gexus
		if(Input.StartPress || Input.APress)
		{
			var set_room = zone_list[zone_sel][act_sel+1]
			fade_to_room(set_room, 3);
			music_set_fade(FADE_OUT, 2);
		}
	}
	
	//Sound test stuff
	if(zone_sel == zone_arr)
	{	
		var size = array_length(sound_arr)
		sound_sel += press_x;
		
		//Mod
		sound_sel %= size;
		
		//Warp
		if(sound_sel < 0) sound_sel = size-1;
		
		
		//Play the sound
		if(Input.StartPress || Input.APress)
		{
			play_music(sound_arr[sound_sel], 0);	
		}
		
		
	}