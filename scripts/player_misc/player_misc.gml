function player_misc(){
	//Subtract timers
	control_lock = max(control_lock-1, 0);
	ceiling_lock = max(ceiling_lock-1, 0);
	
	//Handle player shields
	if(shield != S_NONE)
	{
		if(!instance_exists(shield_list[shield]))
		{
			instance_create_depth(x, y, depth - 10, shield_list[shield])	
		}
		
		if(shield != par_shield.shield_id)
		{
			with(par_shield) instance_destroy();	
		}
	}else{
		with(par_shield) instance_destroy();
	}
	
}