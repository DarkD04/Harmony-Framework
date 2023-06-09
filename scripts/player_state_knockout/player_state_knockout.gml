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
		
		case K_DROWN:
			//Change player depth
			depth = layer_get_depth("Utilities");
			
			//Remove underwater physics
			if(knockout_type == K_DIE)underwater = false;
			
			//Change animation
			if(knockout_type == K_DIE)animation = ANIM_DIE; else animation = ANIM_DROWN;
			
			//Disable collision
			collision_allow = false;
			
			//Add death timer
			death_timer += 1;
			
			//Remove effects
			shield = S_NONE;
			invincible_timer = 0;
			speed_shoes = 0;
			invincible = false;
			speed_shoes_flag = false;
			
			//Fade out
			if(death_timer == 80)
			{
				obj_fade.fade_speed = 3;
				obj_fade.fade_type = fade_out;
				obj_music.fade_speed = 2
				obj_music.fade = MusicFadeOut;
			}
			
			//Create bunch of bubbles for drowning event
			if(global.object_timer mod 4 == 0 && knockout_type == K_DROWN){
				var bubble = instance_create_depth(x, y-12, depth-1, obj_bubble);
				bubble.type = 0;	
				bubble.angle = random(360);
			}
			
			//Restart
			if(death_timer == 140)
			{
				room_restart();
			}
		break;
	}
}