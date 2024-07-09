	//Essential values
	zone_sel = 0;
	act_sel = 0;
	sound_sel = 0;
	
	//The lists
	zone_list = [["ARBOREAL AGATE", rm_arboreal_agate1, rm_arboreal_agate2], ["BRIDGE", rm_bridge] ];
	
	reset_stage_data();
	global.score = 0;
	sound_bank = [bgm_arboreal_agate1];
	
    //2024 Additions: ^-^    <-- Kaguya smiling mug shot be like    Dark i hope you get your penid crushed
	
	quotes = ["PUT WHATEVER YOU WANT HERE!", "YOU CAN ALWAYS ADD MORE"];
	
	quote_index = irandom(array_length(quotes)-1);
	
	//Randomize the BG
	image_speed = 0;
	image_index = 0//irandom(image_number);
	