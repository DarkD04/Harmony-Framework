	/// @description Pre - Game events
	
	//Deactivate all of the objects if the flag is off
	if(!global.process_objects)
	{
		//List for objects that shouldn't be disabled
		var ignore_objects = [obj_input, obj_window, obj_dev, obj_shell, obj_pause, obj_devmenu];
		
		//Store all of the disabled objects to the list
		with(all)
		{
			ds_list_add(other.process_object_list, id);	
		}
		
		//Disable all of the objects except this one
		instance_deactivate_all(true);
		
		//Enable the ones that are ignored
		for (var i = 0; i < array_length(ignore_objects); ++i) 
		{
		    instance_activate_object(ignore_objects[i])
		}
		
	}