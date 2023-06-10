/// @description Finish the act transition

	//Reset monitor values
	global.monitor_store = [];
	global.monitor_id = 0;
	
	//Shield event
	if(instance_exists(par_shield)) par_shield.image_index = shield_frame;
	
	//Bye 
	instance_destroy();