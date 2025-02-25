/// @description Game events
	
	//Suspend everything in here if objects are not processed anymore
	if(!global.process_objects)
	{
		exit;	
	}
	
	//Add the frame timer
	global.object_timer++;