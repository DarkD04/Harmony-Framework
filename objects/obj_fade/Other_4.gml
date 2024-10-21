/// @description Values
	//Stop
	if(!fade_reset) exit;
	
	//Fade values
	fade_timer = 512;
	fade_type = FADE_IN;
	fade_room = noone;
	
	//Fade macros
	#macro FADE_IN 1
	#macro FADE_OUT -1
	#macro FADE_BLACK 0
	#macro FADE_WHITE 1