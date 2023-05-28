function fade_to_room(room_target, fade_speed){
	//Temp value
	var fade;
	
	//Get the object
	fade = obj_fade;
	
	//Set room target
	fade.fade_room = room_target;
	
	//Set fade speed
	fade.fade_speed = fade_speed;
	
	//Set to correct fade mode
	fade.fade_type = fade_out;
}

function fade_in_room(fade_speed){
	//Temp value
	var fade;
	
	//Get the object
	fade = obj_fade;
	
	//Prevent shit from fucking up lmao
	fade.fade_reset = false;
	
	//Set fade to black
	fade.fade_timer = 512;
	
	//Set fade speed
	fade.fade_speed = fade_speed;
	
	//Set to correct fade mode
	fade.fade_type = fade_in;
	
	
}