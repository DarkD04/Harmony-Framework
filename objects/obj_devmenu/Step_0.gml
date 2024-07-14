/// @description Script

	//Fuck all lmao
	instance_deactivate_all(true);
    instance_activate_object(Input); 
    instance_activate_object(obj_window);  
	
	//Exit
	if(keyboard_check_pressed(vk_escape) && CoolDown = 0){
		instance_activate_all();
		instance_destroy();
	}
		
		
	//Select
	if(keyboard_check_pressed(vk_up))
		Select -= 1;
	
	if(keyboard_check_pressed(vk_down))
		Select += 1;
	
	if Section = 0 && Select < 0
		Select = 3;
	
	if Section = 0 && Select > 3
		Select = 0;

	CoolDown = max(CoolDown-1,0)
	
	switch(Section){
		case 1: Select = clamp(Select,0,array_length(Presentation)-1) break;	
		//case 2: instance_activate_all() room_goto(rm_stage_select) reset_stage_data() break;
		case 3: Select = clamp(Select,0,room_last) break;	
	}
	//Enter Selections
	if(keyboard_check_pressed(vk_enter) && Section = 0){
		Section = Select+1;
		CoolDown = 2;
		Select = 0;
	}

	//Enter shit

	if(keyboard_check_pressed(vk_enter) && CoolDown = 0){
		instance_activate_all();
		switch(Section){
			case 1: room_goto(Presentation[Select]) reset_stage_data() break;
			//case 2: room_goto(Stages[Select]) reset_stage_data() break;
			case 3: room_goto(Select) reset_stage_data() break;
		}
	
	}
	
	//Return
	if(keyboard_check_pressed(ord("S"))  && Section > 0){
		 Section = 0	
		 Select = 0;
	}
	
	if(Section = 4)
		game_end();