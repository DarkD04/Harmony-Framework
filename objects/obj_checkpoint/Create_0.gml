/// @description Values
	triggered = false;
	angle = 0;
	
	//Set all checkpoints to be triggered
	if(ds_list_find_index(global.checkpoint, id) != -1)
	{
		triggered = true;
		angle = 720;
	}