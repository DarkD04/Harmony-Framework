function player_state_knockout(){
	//Stop executing
	if(state != ST_KNOCKOUT) exit;
	
	//Change flags
	direction_allow = false;
	movement_allow = false;
	
	//Different knockout states
	switch(knockout_type)
	{
		case K_HURT:
			//Change animation
			animation = ANIM_HURT;
			
			//Exit when grounded
			if(ground)
			{
				state = ST_NORMAL;
				ground_speed = 0;
				knockout_type = 0;
			}
		break;
		
		case K_DIE:
			//Change player depth
			depth = layer_get_depth("Utilities");
			
			//Change animation
			animation = ANIM_DIE;
			
			//Disable collision
			collision_allow = false;
			
			//Add death timer
			death_timer += 1;
			
			//Fade out
			if(death_timer = 80)
			{
				obj_fade.fade_speed = 3;
				obj_fade.fade_type = fade_out;
				obj_music.fade_speed = 2
				obj_music.fade = MusicFadeOut;
			}
			
			//Restart
			if(death_timer = 140)
			{
				room_restart();
			}
		break;
	}
}