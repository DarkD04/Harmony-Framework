function fade_to_room(room_target, fade_speed, fade_color = FADE_BLACK){
	//Temp value
	var fade;
	
	//Get the object
	fade = obj_fade;
	
	//Set room target
	fade.fade_room = room_target;
	
	//Set fade speed
	fade.fade_speed = fade_speed;
	
	//Set to correct fade mode
	fade.fade_type = FADE_OUT;
	
	//Change the fade color
	fade.fade_white = fade_color;
}

function fade_to_room_next(fade_speed, fade_color = FADE_BLACK){
	//Temp value
	var fade;
	
	//Get the object
	fade = obj_fade;
	
	//Set room target
	fade.fade_room = real(room)+1;
	
	//Set fade speed
	fade.fade_speed = fade_speed;
	
	//Set to correct fade mode
	fade.fade_type = FADE_OUT;
	
	//Change the fade color
	fade.fade_white = fade_color;
}


function fade_in_room(fade_speed, fade_color = FADE_BLACK){
	//Temp value
	var fade;
	
	//Get the object
	fade = obj_fade;
	
	//Prevent shit from fucking up lmao
	fade.fade_reset = false;
	
	//Set fade to black
	fade.fade_timer = 0;
	
	//Set fade speed
	fade.fade_speed = fade_speed;
	
	//Set to correct fade mode
	fade.fade_type = FADE_IN;
	
	//Change the fade color
	fade.fade_white = fade_color;
}

function fade_change(fade_mode, fade_speed, fade_color = FADE_BLACK){
	//Temp value
	var fade;
	
	//Get the object
	fade = obj_fade;
	
	//Set fade speed
	fade.fade_speed = fade_speed;
	
	//Set to correct fade mode
	fade.fade_type = fade_mode;
	
	//Change the fade color
	fade.fade_white = fade_color;
}
