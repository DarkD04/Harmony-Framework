	//Essential values
	zone_sel = 0;
	act_sel = 0;
	sound_sel = 0;
	
	//The lists
	zone_list = [["ARBOREAL AGATE", rm_arboreal_agate1, rm_arboreal_agate2]];
	
	reset_stage_data();
	global.score = 0;

	quotes = ["WELCOME TO HARMONY FRAMEWORK!"];
	
	quote_index = irandom(array_length(quotes)-1);
	
	//Randomize the BG
	image_speed = 0;
	image_index = 0//irandom(image_number);
	
	fade_in_room(5);
	play_music(BGM_MENU);
	
	//Create stage data
	for (var i = 0; i < 128; ++i) 
	{
	    deform_data[i] = 12 * dsin((360 / 128) * i);
	}